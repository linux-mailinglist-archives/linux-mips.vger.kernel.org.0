Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C40269F67C
	for <lists+linux-mips@lfdr.de>; Wed, 22 Feb 2023 15:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbjBVOXU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Feb 2023 09:23:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbjBVOXQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Feb 2023 09:23:16 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E11A046BC;
        Wed, 22 Feb 2023 06:22:50 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7596E139F;
        Wed, 22 Feb 2023 06:23:33 -0800 (PST)
Received: from [10.57.16.42] (unknown [10.57.16.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D72D93F881;
        Wed, 22 Feb 2023 06:22:48 -0800 (PST)
Message-ID: <732cab3d-e03e-f201-d4ec-aa8c0f7cece7@arm.com>
Date:   Wed, 22 Feb 2023 14:22:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 0/7] MIPS DMA coherence fixes
Content-Language: en-GB
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        mpe@ellerman.id.au, paul.walmsley@sifive.com, palmer@dabbelt.com,
        Rob Herring <robh+dt@kernel.org>, m.szyprowski@samsung.com
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
 <20230221175423.GA15247@lst.de>
 <A8AC22A0-E883-4D9B-A629-5A3721B976C5@flygoat.com>
 <ed2d7750-786d-82a1-5e79-1f216a682b20@arm.com>
 <34578218-DC7A-4C8B-A01A-AD64831CCB43@flygoat.com>
 <a46e1840-89be-de8f-6a91-3e4a16fa17c2@arm.com>
 <CBE3717B-E49A-4BAA-9CD0-FFD2462B9CE0@flygoat.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CBE3717B-E49A-4BAA-9CD0-FFD2462B9CE0@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2023-02-22 13:04, Jiaxun Yang wrote:
> 
> 
>> 2023年2月22日 12:55，Robin Murphy <robin.murphy@arm.com> 写道：
>>
>> On 2023-02-21 19:55, Jiaxun Yang wrote:
>>>> 2023年2月21日 19:46，Robin Murphy <robin.murphy@arm.com> 写道：
>>>>
>>>> On 2023-02-21 18:15, Jiaxun Yang wrote:
>>>>>> 2023年2月21日 17:54，Christoph Hellwig <hch@lst.de> 写道：
>>>>>>
>>>>>> Can you explain the motivation here?  Also why riscv patches are at
>>>>>> the end of a mips fіxes series?
>>>>> Ah sorry for any confusion.
>>>>> So the main purpose of this patch is to fix MIPS’s broken per-device coherency.
>>>>> To be more precise, we want to be able to control the default coherency for all devices probed from
>>>>> devicetree in early boot code.
>>>>
>>>> Including the patch which actually does that would be helpful. As it is, patches 4-7 here just appear to be moving an option around for no practical effect.
>>> Well the affect is default coherency of devicetree probed devices are now following dma_default_coherent
>>> instead of a static Kconfig option. For MIPS platform, dma_default_coherent will be determined by boot code.
>>
>> "Will be" is the issue I'm getting at. We can't review some future promise of a patch, we can only review actual patches. And it's hard to meaningfully review preparatory patches for some change without the full context of that change.
> 
> Actually this already present in current MIPS platform code.
> 
> arch/mips/mti-malta is setting dma_default_coherent on boot, and it’s devicetree does not explicitly specify coherency.

OK, this really needs to be explained much more clearly. I read this 
series as 3 actual fix patches, then 3 patches adding a new option to 
replace an existing one on the grounds that it "can be useful" for 
unspecified purposes, then a final cleanup patch removing the old option 
that has now been superseded.

Going back and looking closely I see there is actually a brief mention 
in the cleanup patch that it also happens to fix some issue, but even 
then it doesn't clearly explain what the issue really is or how and why 
the fix works and is appropriate.

Ideally, functional fixes and cleanup should be in distinct patches 
whenever that is reasonable. Sometimes the best fix is inherently a 
cleanup, but in such cases the patch should always be presented as the 
fix being its primary purpose. Please also use the cover letter to give 
reviewers an overview of the whole series if it's not merely a set of 
loosely-related patches that just happened to be convenient so send all 
together.

I think I do at least now understand the underlying problem well enough 
to have a think about whether this is the best way to address it.

Thanks,
Robin.
