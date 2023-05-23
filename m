Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E15D870D8EE
	for <lists+linux-mips@lfdr.de>; Tue, 23 May 2023 11:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235423AbjEWJ0q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 May 2023 05:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235945AbjEWJ0m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 05:26:42 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478AE118;
        Tue, 23 May 2023 02:26:40 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id CB4FE2046A;
        Tue, 23 May 2023 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1684833998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VeeF7P+KGwlI3A5FT4CrZ0MRM4bqCgyOhKvZ384U0bw=;
        b=fmBOz2XQkJ4XHhSdGh/HXGxJtyCnKClPp4X6MRT6VR5eXrTQZK9h5N6Toqfk+0GeD98iT3
        ZDhHKznDkq0Y5mKvraQucwn+Wh9FeAeuFGHWgkercVl2rETq+mQKxe64zKr8IJWHxFZCKE
        O8heNaNMsvS9Ka+Y0g3mOKcA0+3rNN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1684833998;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VeeF7P+KGwlI3A5FT4CrZ0MRM4bqCgyOhKvZ384U0bw=;
        b=zajPamxtH/5SGH5Qq9H7t7b5zBY3QOo+hV3Vqv/J4endm7d1fvc5Ztsv4d+st0dbhUYOxx
        LgejBO7uUF0wFbCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FA5A13588;
        Tue, 23 May 2023 09:26:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id HfC5Es6GbGTEVAAAMHmgww
        (envelope-from <vbabka@suse.cz>); Tue, 23 May 2023 09:26:38 +0000
Message-ID: <c63dc769-e020-5a82-335e-11c992543a3a@suse.cz>
Date:   Tue, 23 May 2023 11:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Qin Jian <qinjian@cqplus1.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20230523091139.21449-1-vbabka@suse.cz>
 <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
From:   Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/23/23 11:22, Geert Uytterhoeven wrote:
> Hi Vlastimil,
> 
> Thanks for your patch!
> 
> On Tue, May 23, 2023 at 11:12 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>> As discussed at LSF/MM [1] [2] and with no objections raised there,
>> deprecate the SLAB allocator. Rename the user-visible option so that
>> users with CONFIG_SLAB=y get a new prompt with explanation during make
>> oldconfig, while make olddefconfig will just switch to SLUB.
>>
>> In all defconfigs with CONFIG_SLAB=y remove the line so those also
>> switch to SLUB. Regressions due to the switch should be reported to
>> linux-mm and slab maintainers.
> 
> Technically, removing these lines from the defconfig files does not
> have any impact, right?

Well, it doesn't, but I thought it's at least a useful heads-up for the
maintainers in case some have specific reasons for keeping SLAB there.

> And it removes one more sync point indicating the last time some
> defconfig files were (not) updated by their maintainers ;-)

Sure, I can exclude yours (and anyone else who'd prefer that), the ack on
the deprecation itself is sufficient.

>> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz/
>> [2] https://lwn.net/Articles/932201/
>>
>> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> 
>>  arch/m68k/configs/amiga_defconfig               |  1 -
>>  arch/m68k/configs/apollo_defconfig              |  1 -
>>  arch/m68k/configs/atari_defconfig               |  1 -
>>  arch/m68k/configs/bvme6000_defconfig            |  1 -
>>  arch/m68k/configs/hp300_defconfig               |  1 -
>>  arch/m68k/configs/mac_defconfig                 |  1 -
>>  arch/m68k/configs/multi_defconfig               |  1 -
>>  arch/m68k/configs/mvme147_defconfig             |  1 -
>>  arch/m68k/configs/mvme16x_defconfig             |  1 -
>>  arch/m68k/configs/q40_defconfig                 |  1 -
>>  arch/m68k/configs/sun3_defconfig                |  1 -
>>  arch/m68k/configs/sun3x_defconfig               |  1 -
> 
> Regardless,
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks!

> Gr{oetje,eeting}s,
> 
>                         Geert
> 

