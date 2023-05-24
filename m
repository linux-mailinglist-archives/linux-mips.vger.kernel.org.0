Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8550A70F8A7
	for <lists+linux-mips@lfdr.de>; Wed, 24 May 2023 16:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbjEXO1I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 May 2023 10:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjEXO1H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 May 2023 10:27:07 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70AA711D;
        Wed, 24 May 2023 07:27:06 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 91B9522041;
        Wed, 24 May 2023 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1684938424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tXGazCQJhB+4Gbe14ojDjDepmPElagpzQVjU1cq9coM=;
        b=CvxJjiwUfSN+kySKUn/EWA67pNGj3pzmDi1HbwCtE90AFBLWe7vv+d8M1Ij3FkSbIz4VTI
        gWvmGqepcrFlLCBiRAAf+FLKtDv7IxP6DOFYzfABdT3HuVDKFvuPv4HouAx5CI/XFNBevQ
        b0eo4MDqgOjEmRFkWmGBuHZT8lU/dcs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1684938424;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tXGazCQJhB+4Gbe14ojDjDepmPElagpzQVjU1cq9coM=;
        b=pq5m/8gWb5XY3U0bzLALdtiUNBu4jqNs3ujyoKqIbmne//9yJpXq+qLIx07FO9Z84ILL6b
        c/7V1xSDO+g6aHAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1777E13425;
        Wed, 24 May 2023 14:27:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id VWz9BLgebmSqKAAAMHmgww
        (envelope-from <vbabka@suse.cz>); Wed, 24 May 2023 14:27:04 +0000
Message-ID: <4f690e97-b26c-1705-51e7-0d7ebc77d819@suse.cz>
Date:   Wed, 24 May 2023 16:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
Content-Language: en-US
To:     David Rientjes <rientjes@google.com>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
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
 <be109b49-8510-5887-72ae-738db9945619@google.com>
From:   Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <be109b49-8510-5887-72ae-738db9945619@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/24/23 02:29, David Rientjes wrote:
> On Tue, 23 May 2023, Vlastimil Babka wrote:
> 
>> As discussed at LSF/MM [1] [2] and with no objections raised there,
>> deprecate the SLAB allocator. Rename the user-visible option so that
>> users with CONFIG_SLAB=y get a new prompt with explanation during make
>> oldconfig, while make olddefconfig will just switch to SLUB.
>> 
>> In all defconfigs with CONFIG_SLAB=y remove the line so those also
>> switch to SLUB. Regressions due to the switch should be reported to
>> linux-mm and slab maintainers.
>> 
>> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz/
>> [2] https://lwn.net/Articles/932201/
>> 
>> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> 
> Acked-by: David Rientjes <rientjes@google.com>

Thanks.

> The Kconfig option says that SLAB will be removed in a few cycles.  I 
> think we should wait until at least the next LTS kernel is forked at the 
> end of the year so that users who upgrade to only the LTS releases can be 
> prompted for this change and surface any concerns.  Slab allocation is a 
> critical subsystem, so I presume this is the safest and most responsible 
> way to do the SLAB deprecation.  Hopefully that timeline works for 
> everybody.

Sure, and in fact looking at predicted release dates [1], if the deprecation
goes into 6.5 then 6.7 ("few" == 2) is already end of January 2024, anyway.

[1] https://hansen.beer/~dave/phb/
