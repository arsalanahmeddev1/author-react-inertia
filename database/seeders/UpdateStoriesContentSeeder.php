<?php

namespace Database\Seeders;

use App\Models\Story;
use Illuminate\Database\Seeder;

class UpdateStoriesContentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get all stories
        $stories = Story::all();

        foreach ($stories as $story) {
            // Generate sample content based on the story title and description
            $content = $this->generateSampleContent($story);
            
            // Update the story with the content
            $story->update([
                'content' => $content
            ]);
        }

        $this->command->info('Stories updated with sample content!');
    }

    /**
     * Generate sample content for a story.
     */
    private function generateSampleContent($story): string
    {
        // Create a basic HTML structure for the story content
        $content = "<h2>{$story->title}</h2>\n";
        $content .= "<p class=\"author\">By {$story->author}</p>\n\n";
        
        // Add paragraphs based on the description
        $paragraphs = explode('. ', $story->description);
        
        // Add an introduction
        $content .= "<p>The sun cast long shadows across the landscape as our story begins. " . 
                   "The world of {$story->title} is one of mystery and intrigue, where nothing is quite as it seems.</p>\n\n";
        
        // Add the description paragraphs
        foreach ($paragraphs as $paragraph) {
            if (strlen($paragraph) > 10) {
                $content .= "<p>{$paragraph}.</p>\n\n";
            }
        }
        
        // Add some fictional content based on the genre
        switch ($story->genre) {
            case 'Mystery':
                $content .= $this->getMysteryContent();
                break;
            case 'Romance':
                $content .= $this->getRomanceContent();
                break;
            case 'Horror':
                $content .= $this->getHorrorContent();
                break;
            case 'Fantasy':
                $content .= $this->getFantasyContent();
                break;
            case 'Science Fiction':
                $content .= $this->getSciFiContent();
                break;
            case 'Thriller':
                $content .= $this->getThrillerContent();
                break;
            case 'Historical Fiction':
                $content .= $this->getHistoricalContent();
                break;
            case 'Adventure':
                $content .= $this->getAdventureContent();
                break;
            default:
                $content .= $this->getGenericContent();
        }
        
        // Add a conclusion
        $content .= "<p>As our story draws to a close, many questions remain unanswered. " .
                   "What will happen next? Only time will tell, as the journey continues...</p>\n\n";
        
        return $content;
    }
    
    private function getMysteryContent(): string
    {
        return "<p>Detective Sarah Morgan studied the crime scene with practiced eyes. Something wasn't right about the way the body was positioned. It was too... deliberate. As if someone wanted it to be found exactly like this.</p>\n\n" .
               "<p>\"Time of death?\" she asked the medical examiner who was crouched beside the victim.</p>\n\n" .
               "<p>\"Between midnight and 2 AM,\" he replied, not looking up from his work. \"Cause appears to be asphyxiation, but I'll know more after the autopsy.\"</p>\n\n" .
               "<p>Sarah nodded, making notes in her small black notebook. The victim—male, mid-forties, well-dressed—had no identification on him. No wallet, no phone, nothing that could tell them who he was. Just a single playing card tucked into his breast pocket: the Queen of Hearts.</p>\n\n" .
               "<p>\"It's him again,\" said Detective James Reynolds, her partner of five years. \"The Queen Killer.\"</p>\n\n" .
               "<p>Sarah frowned. \"We don't know that yet. Let's not jump to conclusions.\"</p>\n\n" .
               "<p>But privately, she feared Reynolds was right. After three months of silence, the notorious serial killer who had terrorized the city last winter might be back. And if the pattern held, they had less than 48 hours before another body would appear.</p>\n\n" .
               "<p>As she surveyed the abandoned warehouse where the body had been discovered, Sarah noticed something glinting in the weak morning light. Carefully, she approached and found a small silver cufflink half-hidden beneath a wooden pallet. It was expensive, engraved with the initials 'E.H.'</p>\n\n" .
               "<p>\"Bag this,\" she told the crime scene technician. It might be nothing—or it might be the first real clue they'd ever had about the Queen Killer's identity.</p>\n\n" .
               "<p>What Sarah didn't know was that finding this clue had set in motion a chain of events that would lead her into the darkest corners of the city's elite society—and put her directly in the killer's crosshairs.</p>\n\n";
    }
    
    private function getRomanceContent(): string
    {
        return "<p>Elizabeth Bennett stood at the edge of the ballroom, watching the dancers twirl in elegant circles. She had never been one for these society gatherings, preferring the company of a good book to that of the preening aristocrats who filled the room. But her mother had insisted, and so here she was, pressed against the wall in her best dress, trying to become invisible.</p>\n\n" .
               "<p>\"Not dancing this evening, Miss Bennett?\"</p>\n\n" .
               "<p>The deep voice startled her, and she turned to find herself looking up into the dark eyes of Mr. Darcy. He was as handsome as ever in his formal attire, his expression unreadable as always.</p>\n\n" .
               "<p>\"I prefer to observe,\" she replied, lifting her chin slightly. \"One learns so much more about people that way.\"</p>\n\n" .
               "<p>\"And what have you learned about me, I wonder?\" There was a hint of amusement in his voice that she had never heard before.</p>\n\n" .
               "<p>Elizabeth felt her cheeks warm. \"That you are just as content to stand at the edges as I am, Mr. Darcy. Though I suspect for different reasons.\"</p>\n\n" .
               "<p>\"Perhaps not so different,\" he said quietly. Then, to her astonishment, he extended his hand. \"Would you do me the honor of this dance, Miss Bennett?\"</p>\n\n" .
               "<p>She hesitated only a moment before placing her gloved hand in his. \"I must warn you, I'm not particularly accomplished.\"</p>\n\n" .
               "<p>\"Then we shall be unaccomplished together,\" he replied, and for the first time since she had known him, Mr. Darcy smiled—a genuine smile that transformed his severe features and made Elizabeth's heart beat a little faster.</p>\n\n" .
               "<p>As he led her onto the dance floor, Elizabeth had the strangest feeling that something important had just happened, though she couldn't quite say what. All she knew was that suddenly, the evening had become much more interesting.</p>\n\n";
    }
    
    private function getHorrorContent(): string
    {
        return "<p>The old house at the end of Blackwood Lane had been empty for as long as anyone in town could remember. Local children dared each other to touch its rusted gate, to peer through its dusty windows, but none were brave enough to venture inside. There were stories about the house—about the family that had lived there once, about the terrible things that had happened within its walls.</p>\n\n" .
               "<p>Mark Davis didn't believe in ghost stories. As a real estate developer, he saw the property for what it was: prime real estate in a growing market. The fact that he'd gotten it for a fraction of its value was just a bonus. Superstitious locals meant nothing to him.</p>\n\n" .
               "<p>That was before he spent his first night in the house.</p>\n\n" .
               "<p>It started with sounds—faint at first, like the settling of an old building. Creaks and groans that he told himself were normal. But then came the whispers, too quiet to make out the words but unmistakably human. And the footsteps on the floor above, pacing back and forth, back and forth, when he knew he was alone in the house.</p>\n\n" .
               "<p>By midnight, Mark was sitting in his car, keys in the ignition, telling himself he was being ridiculous. He was a grown man, for God's sake. There was no such thing as ghosts.</p>\n\n" .
               "<p>He forced himself to go back inside, to climb the stairs to the master bedroom where he'd left his phone. The door was closed, though he was certain he'd left it open. His hand trembled as he reached for the knob.</p>\n\n" .
               "<p>The room beyond was dark, but not empty. In the pale moonlight streaming through the window, Mark could make out a figure standing in the corner—the silhouette of a woman in an old-fashioned dress, her head tilted at an unnatural angle.</p>\n\n" .
               "<p>\"Who's there?\" he demanded, his voice breaking. \"This is private property.\"</p>\n\n" .
               "<p>The figure didn't move, didn't speak. But slowly, it began to turn toward him, and Mark caught a glimpse of its face—or rather, where its face should have been.</p>\n\n" .
               "<p>His scream echoed through the empty house, but there was no one to hear it. By morning, the house on Blackwood Lane was empty once more, waiting for its next occupant.</p>\n\n";
    }
    
    private function getFantasyContent(): string
    {
        return "<p>The dragon's scales gleamed like burnished copper in the setting sun as it soared above the Misty Mountains. Astride its massive neck sat Elian, the last of the Dragonriders, his white-knuckled hands gripping the leather harness that was his only security hundreds of feet above the ground.</p>\n\n" .
               "<p>\"We need to find shelter before nightfall, Fyreth,\" he called to the dragon, his words whipped away by the wind. But dragons had keen hearing, and Fyreth banked gently to the left, heading toward a plateau jutting from the mountainside.</p>\n\n" .
               "<p>They had been flying for three days, ever since the attack on the Citadel. Elian still couldn't believe it had fallen—the ancient fortress had stood for a thousand years, home to generations of Dragonriders. Now it was a smoking ruin, and as far as he knew, he and Fyreth were the only survivors.</p>\n\n" .
               "<p>The dragon landed with surprising grace for a creature of its size, folding its massive wings as Elian dismounted. The young rider removed his helmet, running a hand through his sweat-dampened hair as he surveyed their temporary haven.</p>\n\n" .
               "<p>\"We should be safe here for the night,\" he told Fyreth, who was already settling down, curling its tail around its body like a cat. The dragon's amber eyes, each the size of a dinner plate, regarded him with intelligence that still sometimes took Elian by surprise, even after five years of their bond.</p>\n\n" .
               "<p>*They will be hunting us,* Fyreth's voice resonated in Elian's mind, a deep rumble like distant thunder.</p>\n\n" .
               "<p>\"I know,\" Elian replied grimly, unpacking his meager supplies. \"But they won't expect us to head east. Everyone will assume we'd make for the Southern Isles.\"</p>\n\n" .
               "<p>*And why aren't we?* There was a note of curiosity in the dragon's mental voice.</p>\n\n" .
               "<p>Elian paused, looking out over the darkening landscape. In the far distance, he could just make out the glittering ribbon of the Great River. Beyond that lay the Shadowlands, a place no Dragonrider had ventured in living memory.</p>\n\n" .
               "<p>\"Because,\" he said slowly, \"I think I know who betrayed the Citadel. And I intend to find them before they realize I'm alive.\"</p>\n\n" .
               "<p>Fyreth's approval rumbled through their bond. *Then we hunt.*</p>\n\n" .
               "<p>As night fell over the mountains, Elian made his plans. Tomorrow they would cross into the Shadowlands, where ancient magic still held sway and forgotten secrets waited to be uncovered. It was a dangerous path, but he was a Dragonrider—perhaps the last Dragonrider—and he would not hide while those responsible for the Citadel's fall went unpunished.</p>\n\n";
    }
    
    private function getSciFiContent(): string
    {
        return "<p>The colony ship Artemis hung in orbit around Proxima Centauri b, its massive solar sails gleaming in the light of humanity's nearest stellar neighbor. After a journey of 4.3 light years—or 87 years for the crew, even with cryosleep—they had finally arrived at what would become humanity's first extrasolar colony.</p>\n\n" .
               "<p>Commander Elena Reyes stood on the observation deck, watching as the first shuttle prepared to descend to the planet's surface. The initial surveys had been promising: breathable atmosphere, Earth-like gravity, liquid water. But there was only so much their probes could tell them. The real exploration would begin today.</p>\n\n" .
               "<p>\"Nervous?\" Dr. Marcus Chen joined her at the viewport, his reflection appearing beside hers in the reinforced glass.</p>\n\n" .
               "<p>Elena smiled faintly. \"Wouldn't you be? We're about to set foot on an alien world.\"</p>\n\n" .
               "<p>\"A world that will be home to our children, and their children after them,\" Marcus reminded her. \"That's worth a little nervousness.\"</p>\n\n" .
               "<p>She nodded, watching as the shuttle detached from the Artemis and began its descent, growing smaller until it was just a glinting speck against the blue-green backdrop of Proxima b.</p>\n\n" .
               "<p>Her communicator chimed, and she activated it with a tap. \"Reyes here.\"</p>\n\n" .
               "<p>\"Commander, you need to come to the science lab immediately.\" It was Dr. Lakshmi Patel, the expedition's chief xenobiologist. Something in her voice made Elena's skin prickle.</p>\n\n" .
               "<p>\"What is it, Lakshmi?\"</p>\n\n" .
               "<p>A pause. \"We've detected something on the surface. Something that... shouldn't be there.\"</p>\n\n" .
               "<p>Elena and Marcus exchanged glances before hurrying to the lab. When they arrived, Lakshmi was hunched over a holographic display showing a topographical map of the landing site.</p>\n\n" .
               "<p>\"There,\" she said, pointing to what looked like a perfectly straight line cutting across the natural contours of the landscape. \"And here, and here.\" More lines, forming a geometric pattern that was unmistakably artificial.</p>\n\n" .
               "<p>\"Are you saying...?\" Elena couldn't finish the question.</p>\n\n" .
               "<p>Lakshmi looked up, her expression a mixture of excitement and fear. \"We're not the first intelligent species to set foot on Proxima b, Commander. Someone—or something—was here before us.\"</p>\n\n" .
               "<p>As if on cue, the shuttle's transmission came through, the voice of its pilot tense with awe and disbelief: \"Artemis, this is Shuttle One. You're not going to believe what we're seeing down here...\"</p>\n\n";
    }
    
    private function getThrillerContent(): string
    {
        return "<p>The clock on the wall of the situation room read 3:17 AM when the secure phone line rang. CIA Director Thomas Hargrove, who had been dozing in his chair, jerked awake and reached for the receiver.</p>\n\n" .
               "<p>\"Hargrove,\" he answered, his voice rough with fatigue.</p>\n\n" .
               "<p>\"Sir, it's Langley. We've got confirmation. Helix is active.\"</p>\n\n" .
               "<p>Those four words sent a jolt of adrenaline through Hargrove's system, banishing any trace of sleepiness. Helix was a sleeper agent they'd been tracking for years—a ghost who had infiltrated the highest levels of government. And now, after years of dormancy, Helix was on the move.</p>\n\n" .
               "<p>\"Where?\" Hargrove demanded, already reaching for his secure tablet.</p>\n\n" .
               "<p>\"Berlin, sir. Our asset spotted him at Tegel Airport thirty minutes ago. He's traveling under the name Michael Reese, Canadian passport.\"</p>\n\n" .
               "<p>Hargrove pulled up the file on his tablet, scanning the sparse information they had on Helix. Male, approximately 40-50 years old, expert in deep cover operations. Suspected of involvement in at least seven assassinations across three continents. No confirmed photographs existed.</p>\n\n" .
               "<p>\"Do we have eyes on him now?\"</p>\n\n" .
               "<p>\"Negative, sir. He gave our asset the slip in the terminal. But we know he's still in Berlin.\"</p>\n\n" .
               "<p>Hargrove swore under his breath. \"The Chancellor is giving her address at the EU Summit tomorrow. If Helix is in Berlin...\"</p>\n\n" .
               "<p>He didn't need to finish the thought. If Helix was in Berlin, someone was about to die.</p>\n\n" .
               "<p>\"Get me Agent Blackwood,\" Hargrove ordered. \"And alert our liaison at the BND. I want every available agent on this.\"</p>\n\n" .
               "<p>\"Sir, Agent Blackwood is still in Istanbul, dealing with the fallout from the embassy situation.\"</p>\n\n" .
               "<p>Hargrove checked his watch. \"Then get her on a plane. I want her in Berlin by noon.\"</p>\n\n" .
               "<p>As he hung up, Hargrove stared at the dossier on his screen. Sarah Blackwood was their best field agent, with an uncanny ability to think like the targets she hunted. If anyone could track down Helix before he completed his mission, it was her.</p>\n\n" .
               "<p>But even as he made the arrangements, a nagging doubt gnawed at him. Helix had never failed. And if they couldn't stop him this time, the political landscape of Europe was about to change dramatically—and violently.</p>\n\n" .
               "<p>The clock was ticking.</p>\n\n";
    }
    
    private function getHistoricalContent(): string
    {
        return "<p>Paris, June 1940</p>\n\n" .
               "<p>The sound of German boots on cobblestone streets had become a familiar rhythm in the week since the occupation began. Mathilde Fournier paused in her work, listening as a patrol passed beneath the window of her small apartment. When they had gone, she returned to the wireless radio hidden beneath a false panel in her kitchen cabinet.</p>\n\n" .
               "<p>At twenty-six, Mathilde had never imagined she would become part of the resistance. Before the war, she had been a librarian, more comfortable among books than people. But when the Germans marched into Paris, something had awakened in her—a fierce love for her country and a determination that France would not fall without a fight.</p>\n\n" .
               "<p>The coded message she was transcribing had come through just before dawn, transmitted from London. It contained instructions for a supply drop that would happen in three days' time—medical supplies, ammunition, and radio parts that the growing resistance network desperately needed.</p>\n\n" .
               "<p>A knock at the door made her freeze. Three quick taps, a pause, then two more. The signal. Quickly, she concealed the radio and her notes before opening the door.</p>\n\n" .
               "<p>Jean-Pierre Mercier stood in the hallway, his face grim. Once a professor of history at the Sorbonne, he was now one of the leaders of their resistance cell.</p>\n\n" .
               "<p>\"Maurice has been arrested,\" he said without preamble as she let him in. \"The Gestapo took him last night.\"</p>\n\n" .
               "<p>Mathilde felt the blood drain from her face. Maurice knew names, locations, codes. If he broke under interrogation...</p>\n\n" .
               "<p>\"We need to move the drop point,\" she said, already thinking ahead. \"And warn the others.\"</p>\n\n" .
               "<p>Jean-Pierre nodded. \"I've already started. But there's something else.\" He hesitated, then continued. \"We've received word from London. They're sending someone—a British agent to help coordinate our efforts with the other cells in the region.\"</p>\n\n" .
               "<p>\"When?\"</p>\n\n" .
               "<p>\"Tonight. He'll be dropped outside the city. You need to be the one to meet him.\"</p>\n\n" .
               "<p>Mathilde understood what he wasn't saying. With Maurice arrested, she was one of the few who could recognize the authentication codes the agent would use. It was a dangerous assignment—the countryside would be crawling with German patrols—but necessary.</p>\n\n" .
               "<p>\"I'll be ready,\" she said simply.</p>\n\n" .
               "<p>As Jean-Pierre gave her the details, Mathilde felt a familiar mixture of fear and resolve settle in her stomach. This was her war now—fought not with tanks and planes, but with whispers and shadows, coded messages and secret meetings. And like every member of the resistance, she knew that each day could be her last.</p>\n\n" .
               "<p>But France would be free again. Of that, she was certain.</p>\n\n";
    }
    
    private function getAdventureContent(): string
    {
        return "<p>The jungle heat pressed down like a physical weight as Dr. Maya Rivera hacked through the dense undergrowth with her machete. Sweat soaked her khaki shirt, and mosquitoes buzzed incessantly around her head despite the repellent she'd applied that morning.</p>\n\n" .
               "<p>\"We should be getting close,\" she called back to the small expedition team following her. \"The coordinates from the manuscript put Zintal just beyond that ridge.\"</p>\n\n" .
               "<p>Her guide, a local man named Carlos who knew these mountains better than anyone, looked skeptical. \"Dr. Rivera, people have been searching for the lost city for centuries. What makes you think you've found it?\"</p>\n\n" .
               "<p>Maya paused, wiping sweat from her brow. \"Because everyone else was looking in the wrong place. The Mendoza manuscript doesn't describe Zintal as being in a valley—it's on a plateau. Hidden in plain sight.\"</p>\n\n" .
               "<p>The manuscript had been her obsession for the past five years—a 16th-century account written by a Spanish conquistador who claimed to have found a city of gold high in the mountains of what was now Colombia. Most historians dismissed it as fantasy or exaggeration, but Maya had found correlations with other historical records that convinced her Zintal was real.</p>\n\n" .
               "<p>And now, after months of planning and weeks of trekking through some of the most inhospitable terrain on Earth, she was close to proving it.</p>\n\n" .
               "<p>The team made camp at the base of the ridge, planning to make the final ascent at dawn. As night fell, bringing a chorus of jungle sounds, Maya sat by the fire reviewing her notes. The others had already retired to their tents, exhausted from the day's journey.</p>\n\n" .
               "<p>A twig snapped in the darkness beyond the circle of firelight. Maya looked up sharply, her hand moving instinctively to the knife at her belt.</p>\n\n" .
               "<p>\"Who's there?\" she called, rising to her feet.</p>\n\n" .
               "<p>A figure stepped into the light—a man dressed in hiking gear similar to her own, but newer, less worn by the jungle. He held his hands up to show he was unarmed.</p>\n\n" .
               "<p>\"Dr. Rivera, I presume?\" His accent was British, his smile disarmingly charming. \"James Blackwood. I believe we're looking for the same thing.\"</p>\n\n" .
               "<p>Maya's eyes narrowed. \"How did you find us?\"</p>\n\n" .
               "<p>\"I've been following your progress for some time,\" he admitted. \"Your research on Zintal is quite impressive. But you're not the only one who's decoded the Mendoza manuscript.\"</p>\n\n" .
               "<p>Before Maya could respond, Carlos emerged from his tent, alerted by the voices. His expression changed when he saw Blackwood, a flash of recognition quickly masked.</p>\n\n" .
               "<p>\"You know each other?\" Maya asked, suddenly wary.</p>\n\n" .
               "<p>Carlos wouldn't meet her eyes. \"Dr. Rivera, there's something I should tell you about Zintal...\"</p>\n\n" .
               "<p>But whatever secret Carlos was about to reveal was lost in the sudden eruption of gunfire from the jungle. Maya dove for cover as bullets tore through the camp, her years of fieldwork having taught her that sometimes, the greatest dangers in searching for lost treasures weren't the elements or wild animals—but other people who would kill to claim the prize first.</p>\n\n";
    }
    
    private function getGenericContent(): string
    {
        return "<p>The story unfolds in a world of intrigue and wonder, where characters face challenges that test their resolve and courage. Through trials and tribulations, they discover truths about themselves and the world around them.</p>\n\n" .
               "<p>\"We must continue forward,\" said the protagonist, facing the uncertain path ahead. \"There is no turning back now.\"</p>\n\n" .
               "<p>The journey would not be easy. Obstacles arose at every turn, threatening to derail their quest. But with determination and the bonds of friendship, they pressed on, knowing that their actions would shape the future for generations to come.</p>\n\n" .
               "<p>As day turned to night and back again, the travelers found themselves changed by their experiences. What had begun as a simple mission had become a profound odyssey of self-discovery and growth.</p>\n\n" .
               "<p>\"I never thought I would find myself here,\" one character reflected, gazing at the stars above. \"Yet somehow, it feels like this is exactly where I'm meant to be.\"</p>\n\n" .
               "<p>In the end, it was not the destination that mattered most, but the journey itself—and the people who had shared in its triumphs and sorrows. For in this world, as in our own, it is our connections to others that give life its deepest meaning.</p>\n\n";
    }
}
