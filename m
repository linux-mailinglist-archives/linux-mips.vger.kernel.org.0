Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 242E16C4D90
	for <lists+linux-mips@lfdr.de>; Wed, 22 Mar 2023 15:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjCVO0F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Mar 2023 10:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbjCVO0E (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Mar 2023 10:26:04 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4EE5273E;
        Wed, 22 Mar 2023 07:26:03 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 32CEE33BD9;
        Wed, 22 Mar 2023 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1679495162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/1T5hw9qpuG2AOImWSDWD8F5+eu1OUARaI87Jeroo5M=;
        b=x4MgX53mVKT0FLfchSPpT80TU/Nx9lsedKAL+STO/UH6xpGUjBxZixJ+f3grGw+I142wgD
        sL5t05agVfFyNEpM/Mt+aN1jCJFp9Ri9a23FRIl3fyv7MttKXbeGci9gcfEGKVrY3dAUa6
        kDH38przr24unL5Qu7DKBBpg27HqzY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1679495162;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/1T5hw9qpuG2AOImWSDWD8F5+eu1OUARaI87Jeroo5M=;
        b=BJyaCwp7Vc7NTXtN/Ep4eXUEG0u5BFdokqGUPXP6RKChTIaBTw3ZZExPQawzBLDA86LAoA
        eNaf/L+Q0p+fRXBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 08B8813416;
        Wed, 22 Mar 2023 14:26:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id EdCTAfoPG2R6JQAAMHmgww
        (envelope-from <vbabka@suse.cz>); Wed, 22 Mar 2023 14:26:02 +0000
Message-ID: <a116a23a-747c-f0f7-8aa8-1f336254d5f3@suse.cz>
Date:   Wed, 22 Mar 2023 15:26:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 03/14] mm: move most of core MM initialization to
 mm/mm_init.c
Content-Language: en-US
To:     Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     David Hildenbrand <david@redhat.com>,
        Doug Berger <opendmb@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org
References: <20230321170513.2401534-1-rppt@kernel.org>
 <20230321170513.2401534-4-rppt@kernel.org>
From:   Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20230321170513.2401534-4-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/21/23 18:05, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> The bulk of memory management initialization code is spread all over
> mm/page_alloc.c and makes navigating through page allocator
> functionality difficult.
> 
> Move most of the functions marked __init and __meminit to mm/mm_init.c
> to make it better localized and allow some more spare room before
> mm/page_alloc.c reaches 10k lines.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Acked-by: David Hildenbrand <david@redhat.com>

Acked-by: Vlastimil Babka <vbabka@suse.cz>

