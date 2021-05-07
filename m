Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA19375EDA
	for <lists+linux-mips@lfdr.de>; Fri,  7 May 2021 04:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbhEGCn4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 May 2021 22:43:56 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51205 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231334AbhEGCn4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 May 2021 22:43:56 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 2A1775C00DB;
        Thu,  6 May 2021 22:42:57 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Thu, 06 May 2021 22:42:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=250IqGvz6u58BFoPT4ncZ3T/BSW+bwX
        b69ZJGgm1m6Y=; b=DmnR23jccaLHmGz8kQCwEW30ZRoW37dSJE0BTW4X+qAV4wG
        XLgmaD41kGD5CrwPvLqmerpmQssu/PEkqd98oYKGH+0gollmsdyVxlydC03tJHoU
        ko0SAN0fXFPbkXerETerKSFHp8mOGhCD/OW6yPM1Je6MxtFoVwoh4HJqlE0Q51D5
        EghG3GKHy4K/zBZa86i6/31n0DZtTSGMLaucqmXInqNL022wt8WQeo5VeXcyGKXW
        mt7WLt6FcwiwtAcED/54a08WathJuO9/7VEAr1wWdwe8sWP68toe9H5K85gPNLSJ
        PSx1AwnDI1EVCRFHBlSveQkP6oHQdpp92FxGFFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=250IqG
        vz6u58BFoPT4ncZ3T/BSW+bwXb69ZJGgm1m6Y=; b=QVOH2pa6EYn8CQRf6Q/fH4
        cEt8t7OzmyQ7S+RhDWEdw4kpD+AaSGgbTLnxrhwrZh5yrAnbCXjWyebjr63MDM1f
        OyWFSE7tNJRsuRgiv3pmcRFuuSHBW6BktF1ZbPO6R5LroUnnqeBtaarcfbfIxx4K
        irqb001J0WWwNZ0XIAtOpov6xHYQYipM/35Ti1rr6+9DvyM/2uCetjtVH2Xjetf1
        tixt1wTG26zi6NuyDSqgd4D2izsdCmgqqh4Xnrj2RBG7Hoys7dutrLe0nGmqvqLu
        cAkOvcZ4O8fPgaCnuyEUwmp0qFzJgestsH/NBV0OVt4UO42P1xqJVl/3dljPXKgg
        ==
X-ME-Sender: <xms:MKmUYEEuPU-Fk-nIv0D-w9Kab-NVorJjtEdqAxs9Vw9Qq8qG0ynH9w>
    <xme:MKmUYNUzff48h_TobGwswu1Kh2K57soazzgWrhgx1kSb4L1vxFBApi4brZsYUh9kn
    i-uew4L1bRJwGw2mig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeguddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderreejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdih
    rghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepieetvdefleejud
    elffegudetiedvgeegieehjeeiieduleehuddvlefgueefgedvnecuffhomhgrihhnpehk
    vghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:MKmUYOLHnE2-RhEY_I1AD19gqdXbt5I8xAgLUqsJae9b2LoL8EPWaA>
    <xmx:MKmUYGGTkWxVZMiZj-3ixlLxHlS11A4zP8kxiAsnfvSf-YZVa4YyhQ>
    <xmx:MKmUYKWqFDzO0B1TCjwYi2uvygWEDPUod2Zel5e__7QWMLq0tBYEqg>
    <xmx:MamUYNdJqRC_8-WcmM9Ip2iP1gqG3_yKX0gyaI70jZPw-a1r00GfZw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4C59C1300504; Thu,  6 May 2021 22:42:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <1463598d-8248-4b11-aab6-45bf2f997cd7@www.fastmail.com>
In-Reply-To: <20210506010435.1333647-1-git@xen0n.name>
References: <20210506010435.1333647-1-git@xen0n.name>
Date:   Fri, 07 May 2021 10:42:36 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "WANG Xuerui" <git@xen0n.name>, linux-rtc@vger.kernel.org
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH_v3_0/6]_rtc:_ls2x:_Add_support_for_the_Loongson-2K/?=
 =?UTF-8?Q?LS7A_RTC?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Thu, May 6, 2021, at 9:04 AM, WANG Xuerui wrote:
> It has been a while since v1 of this series was sent (2020-09);
> apparently, I did not have enough time or resource figuring out the exact
> difference between rtc-ls1x and rtc-ls2x to see if the two can in fact be
> merged, even today. Sorry for the long delay!
> 
> According to the manuals, though, the initialization sequence and
> bitfield descriptions look certainly different, so I'm a bit wary about
> just going ahead and merging these. Per Tiezhu's suggestion in the
> previous thread, I'm just re-submitting this series with tags collected
> and Huacai's e-mail address updated. If anyone (probably Loongson guys?)
> could provide more information regarding the possible merger of rtc-ls1x
> and rtc-ls2x, that would be great.
> 
> This patch series adds support for the RTC module found on various
> Loongson systems with the Loongson-2K SoC or the LS7A bridge chip.
> The driver is rewritten from an out-of-tree version to meet mainline
> standards. I write kernel code as a hobby, though, so there might still
> be overlooked issues. Any suggestions are welcome.
> 
> Note that, the Loongson-2K platform was upstreamed after v1 of this
> series, so v2 additionally contains enablement for it. I'm unable to
> test with my 2K board now, however, so Loongson guys, please test this
> series again on your collection of LS7A and 2K systems, thanks!
> 
> This patch is based on next-20210505, since we're in the middle of merge
> window. Should apply cleanly after the merge window closes, though.

For whole series,
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # loongson2k


> 
> v3:
> - Fixed compile error not discovered after rebase (blame sleep
>   deprivation)
> - Tested on Loongson-3A4000 (still need testing on Loongson-2K)
> 
> v2:
> - Rebased on top of latest linux-next
> - Updated Huacai's e-mail address to the kernel.org one
> - Added collected tags
> - Added adaptation for newly upstreamed Loongson-2K platforms
> 
> WANG Xuerui (6):
>   rtc: ls2x: Add support for the Loongson-2K/LS7A RTC
>   dt-bindings: rtc: Add bindings for LS2X RTC
>   MIPS: Loongson64: DTS: Add RTC support to LS7A
>   MIPS: Loongson: Enable LS2X RTC in loongson3_defconfig
>   MIPS: Loongson64: DTS: Add RTC support to Loongson-2K
>   MIPS: Loongson: Enable LS2X RTC in loongson2k_defconfig
> 
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  |   5 +
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |   5 +
>  arch/mips/configs/loongson2k_defconfig        |   1 +
>  arch/mips/configs/loongson3_defconfig         |   1 +
>  drivers/rtc/Kconfig                           |  11 +
>  drivers/rtc/Makefile                          |   1 +
>  drivers/rtc/rtc-ls2x.c                        | 225 ++++++++++++++++++
>  8 files changed, 251 insertions(+)
>  create mode 100644 drivers/rtc/rtc-ls2x.c
> 
> 
> base-commit: 29955e0289b3255c5f609a7564a0f0bb4ae35c7a
> -- 
> 2.30.1
> 
> 


-- 
- Jiaxun
