Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7CB16493D6
	for <lists+linux-mips@lfdr.de>; Sun, 11 Dec 2022 12:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiLKLPq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Dec 2022 06:15:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiLKLPq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 11 Dec 2022 06:15:46 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2BA2BF7E
        for <linux-mips@vger.kernel.org>; Sun, 11 Dec 2022 03:15:43 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 43E405C00A4;
        Sun, 11 Dec 2022 06:15:43 -0500 (EST)
Received: from imap44 ([10.202.2.94])
  by compute2.internal (MEProxy); Sun, 11 Dec 2022 06:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1670757343; x=1670843743; bh=FIaazcUNm5x/Fanz8tfn5EZbXdufbCXLvzf
        3vm1Tu8o=; b=HNis07/RGn2VMXK5urZxNzZIXtm0Td9POes9dtIcD6FcvjphA6Q
        O3nAh8U9XE/82qBrYGewc9v2Dako8L88O3kkPTVARjbeFDPTEXL41415uTwsGnu1
        HIYm+4H6IYbbIuIRRFiCHDel7xIhX+bOH9qzWRB8bYcpighviJYbEcvsMYXZbMqn
        /2ZDRFJTjLli7FrmISLd+WILdElibUUsk+EXsv98tEO1E1kso3IaGSqGBsnGSl5l
        boF/jrLNYaJp//gLifCYuOiYs+/rv4vhWMN+V7LclwA+RDP1oiKI3bxfIzjvpkMt
        13vw92Bqv/2oCFlyNFRGtCBfoK8swiSn0Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:mime-version
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670757343; x=
        1670843743; bh=FIaazcUNm5x/Fanz8tfn5EZbXdufbCXLvzf3vm1Tu8o=; b=e
        Z9VVE7uTjiF7txoLiKy1eWz0FTDTSs3KRgFeP7eXReuTeX/2nSRFzTwbPGrjYfKe
        TG0I0mLIgfmle5y/mr7FJROF5SoBlqd0Oe1bKBGXBT6qmg1M9LHL7YCDLhdr9w4D
        nngFtihlPy5iGMVVzgyjySerAtyc5jtl0GGiJ15HZYiyyh54U+nyQqNvTrS53pNp
        omb+nKJXgZJrjSV9xNQZdgPD1HveCXlDXYNM72ka3+k34ktAfhgts3zL8nXwWYQD
        xQPkKQvMxbyzJ9R6uj4VCyOS4PpTV7F2gYgvGTBiV1+xUIDzlyDWqMb7/qCHj5qf
        dtUPVvLxZ8kk6IW0GRF2A==
X-ME-Sender: <xms:37uVY6P9xKOAqUMWMnUjTxtxPZlNeAgTCoPac32yQ3338gf952cM3Q>
    <xme:37uVY4-M-ip0Ihe2st96H21PPxeofOa_MHWZbHhsH2f-Ieq59SVLbO7O9RQMUCI4F
    -d_TVbCP4wBAsyHhdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeigddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeuhfdvheehgeduueetfeevjedtveelvdelhfeuhffffffgheev
    geffgeeluefhgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:37uVYxSrKvRN0-WVpvnARNq0bJeBlHgYEYh6jecgVx5ZWrBn9783jg>
    <xmx:37uVY6s7Mp-LwFs2Ihcy6HrNxb9EGEsCq4QKWRKs3DCkgoslH1rexA>
    <xmx:37uVYyfO5nFdrumzNTezUFtE0_p3cZD7EoAiiLVbqNvRXjDvGgg8Sg>
    <xmx:37uVY6mW8kdYwWLfPXcakbeL9CRjIRtv4Jt3_NansEk-bHMa8YT1EA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 158DF36A0073; Sun, 11 Dec 2022 06:15:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <183d63f9-c0d8-4054-8cec-7d01184fbaff@app.fastmail.com>
Date:   Sun, 11 Dec 2022 11:15:22 +0000
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Sunsetting some dead on arrival MIPS kernel features?
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

When I'm preparing kernel tree for some future MIPS architecture features like
removal of branch delay slot and CPU identification instructions, I noticed there are
some dead on arrival MIPS architecture features that still supported by kernel.
Those features are increasing our maintenance burden without attracting actual
users. 

I think we should consider about get rid of them in case we can confirmed nobody is
using them.

1. MIPS_CMP, MIPS_VPE_LOADER_CMP, MIPS_VPE_APSP_API_CMP:
CMP framework was designed to abstract out SMP opreations between platforms.
However it never get used by any platform beside MIPS malta EVB for M4K and
M74K family. Even those EVBs can be supported by MIPS_CPS.
Given that it have been marked as DEPRECATED for years, probably it's time to
remove it.

2. CPU_MICROMIPS:
This option is for building kernel with microMIPS ISA, microMIPS is a compression
extension of base MIPS ISA, hardware IP cores can be configured to be microMIPS
only or support both microMIPS + MIPS32.
However it is only implemented by a small number of MTI cores, also confirmed by
hardware team, due to performance penalty it incurred, there is no core that capable
to run Linux (i.e.: with MMU and sufficient memory) shipped as microMIPS only.
Removal of this feature won't remove support for microMIPS user space support,
just we won't be able to build a kernel for microMIPS only CPUs.

Any thoughts?

Thanks
- Jiaxun
