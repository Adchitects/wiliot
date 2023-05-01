<?php
namespace modules;

use Craft;

use craft\base\Element;
use craft\elements\Entry;
use craft\events\ModelEvent;
use craft\helpers\ElementHelper;
use yii\base\Event;
use Algolia\AlgoliaSearch\SearchClient;

/**
 * Custom module class.
 *
 * This class will be available throughout the system via:
 * `Craft::$app->getModule('my-module')`.
 *
 * You can change its module ID ("my-module") to something else from
 * config/app.php.
 *
 * If you want the module to get loaded on every request, uncomment this line
 * in config/app.php:
 *
 *     'bootstrap' => ['my-module']
 *
 * Learn more about Yii module development in Yii's documentation:
 * http://www.yiiframework.com/doc-2.0/guide-structure-modules.html
 */
class Module extends \yii\base\Module
{
    /**
     * Initializes the module.
     */
    public function init()
    {
        // Set a @modules alias pointed to the modules/ directory
        Craft::setAlias('@modules', __DIR__);

        // Set the controllerNamespace based on whether this is a console or web request
        if (Craft::$app->getRequest()->getIsConsoleRequest()) {
            $this->controllerNamespace = 'modules\\console\\controllers';
        } else {
            $this->controllerNamespace = 'modules\\controllers';
        }

        parent::init();

        Event::on(
            Entry::class,
            Element::EVENT_BEFORE_SAVE,
            function(ModelEvent $e) {
                $entry = $e->sender;

                if (ElementHelper::isDraftOrRevision($entry)) {
                    // don’t do anything with drafts or revisions
                    return;
                }

                if ($entry->status == 'disabled' or $entry->removeFromListings == 1 or $entry->eventExternalUrl != '') {
                    // if item is [disabled, hidden from listing, is event with external url] delete from algolia
                    $client = SearchClient::create('BW16XZ9HAY', '56e27ff1f9dc7d41a1d5204da1417d36');
                    $index = $client->initIndex('prod_Wiliot');
                    $index->deleteObject($entry->id);
                    return;
                }

                $handle = $entry->getSection()->handle;

                $viableEntries = ['solutionsDetails', 'applicationsPostsV3', 'productDetails', 'newsListing', 'careers', 'company', 'eventsListing', 'partnerProgram', 'partners', 'podcasts', 'press', 'eventItems', 'newsPosts', 'podcastDetails', 'partnersDetails'];

                if (in_array($handle, $viableEntries)) {
                    $client = SearchClient::create('BW16XZ9HAY', '56e27ff1f9dc7d41a1d5204da1417d36');
                    $index = $client->initIndex('prod_Wiliot');

                    $content = '';

                    if (in_array($handle, ['solutionsDetails', 'applicationsPostsV3', 'productDetails', 'newsListing', 'careers', 'company', 'eventsListing', 'partnerProgram', 'partners', 'podcasts', 'press'])) {
                        $type = 'page';
                    } elseif ($handle == 'eventItems') {
                        $type = 'event';
                        if ($entry->eventContent) {
                            // removes all html tags and new lines
                            $content = preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", strip_tags($entry->eventContent));
                        }
                    } elseif ($handle == 'newsPosts') {
                        $type = 'news';
                        if ($entry->postContent) {
                            // removes all html tags and new lines
                            $content = preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", strip_tags($entry->postContent));
                        }
                    } elseif ($handle == 'podcastDetails') {
                        $type = 'podcast';
                        if ($entry->podcastDetailsContent) {
                            // removes all html tags and new lines
                            $content = preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", strip_tags($entry->podcastDetailsContent));
                        }
                    } elseif ($handle == 'partnersDetails') {
                        $type = 'partner';
                        if ($entry->partnerDescription) {
                            // removes all html tags and new lines
                            $content = preg_replace("/(^[\r\n]*|[\r\n]+)[\s\t]*[\r\n]+/", "\n", strip_tags($entry->partnerDescription));
                        }
                    }

                    $record = [
                        'pageTitle' => $entry->title,
                        'pageType' => $type,
                        'pageContent' => $content,
                        'link' => '/' . $entry->uri . '/',
                        'objectID' => $entry->id,
                    ];

                    $index->saveObject($record);
                }
            }
        );

        Event::on(
            Entry::class,
            Element::EVENT_BEFORE_DELETE,
            function(ModelEvent $e) {
                $entry = $e->sender;

                $client = SearchClient::create('BW16XZ9HAY', '56e27ff1f9dc7d41a1d5204da1417d36');
                $index = $client->initIndex('prod_Wiliot');

                $index->deleteObject($entry->id);
            }
        );
    }
}
