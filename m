Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55FA26A4A25
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 19:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjB0Sqi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 13:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjB0Sqh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 13:46:37 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B882057B
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 10:46:34 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id BDE535C0055;
        Mon, 27 Feb 2023 13:46:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 27 Feb 2023 13:46:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1677523593; x=1677609993; bh=k7xoS8wRwxWAy+JxfJuVES/Lu
        x/LzCk+nkMTBmHCciI=; b=SQx/ShkgEIHM50cVBNruOAOPcJkTVl8vmWgmHN5MQ
        7Vv5iYBx3Hd4ccDG5VRydM2JI84zMPKo76qD/QOJ3ht4OQFhBvrgwFHDmmMS/jcR
        8D6JhsIGeOVUXBKHqR/2Y4eGsjOEqzFGkRBpwC3tPOecI6/P1i7auF9737lfAMzm
        3ZsV2hfOf5XEJULEr/lNlW9o091O/DD7IsS9GGtOzNJQWgUpC5rkYk0cEmR7bNO2
        3lPTZPlhdhdsKjKHuCoDhku6pfallOYpsjhcQy1iUKrZWX4WohROdlzRtrM1KgVK
        xeczpyyEavhR2lQvDiUPRp8z6+bkgPyEvNs1Zzmg5VZyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1677523593; x=1677609993; bh=k7xoS8wRwxWAy+JxfJuVES/Lux/LzCk+nkM
        TBmHCciI=; b=HZB92WesvJFTOHVQY+ZqoLLDp3YHQzNXAZjHMOUgh5mZgt6aOey
        dza66hqhJZf+fCb2JSO8GvZ95EoOL/zXOfc1j7KVxy591griXJhW95aLdDb2TgxM
        EQpRzsU3JFWswa/wIEl5VW4LAR6ybEmTvyz/DH0hpP262Es98D5jmTGBFl5XJa2S
        TmZ91ZDE5wy0AlDL87XuDkj6jBOVyyYGL+3QPYvM7TXIswstKfNiYcpcnPYKw03Q
        PZ6sRbbhgqaI+zpRpD1x4Aj1i2U735tslq61gc1DciBequWSh58V0+DC2j/zP0ej
        G/TxMbQg0k62Xp1FNLIYTIosvw6RD4LF0Dw==
X-ME-Sender: <xms:iPr8Y1gGC1UlWISekB0oU54_9XwxXl0Ij-2kaQA3c39--8WtZ5bhVQ>
    <xme:iPr8Y6Dfeo5AEHdbuP0MqlwDZEeGcCEMV00JiqLHDsoRD-MoAw-hX65W9s2uDZaz5
    jG__dK1dluUHhin4wk>
X-ME-Received: <xmr:iPr8Y1FPG-5kvmV-82RBYSmtk2UfBz3vSzXv1nx6gLD-pdAAYZLm7g38S2jO-cG1AX-mFER2DdrHisV7M6a1wMtlEE21JyczmAIh1g4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddguddufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
    dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedutdduveeileejje
    etffehueejudehgfffjeduhfeuleeludfffefgffevkeenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhm
X-ME-Proxy: <xmx:iPr8Y6T3coxB1-DkGwXrzcNbEpBGhkUf0lYaptyTpAm32WCiwbH-Dg>
    <xmx:iPr8YyyN5NY2aNbmhs6Whd7X6PmEX7mJA9ypNtE7HeWzIduhM18v8w>
    <xmx:iPr8Yw5AnKPokFejt_sTP9GShiGBoP_ac0P8-_6jdaCZNCUK8degjA>
    <xmx:ifr8Y9-TSx-ZttM-bl0WuUpigErx8LolFinbk_Y-_FOhRNVPRtDQLw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 13:46:31 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/2] MIPS Booting fixes
Date:   Mon, 27 Feb 2023 18:46:12 +0000
Message-Id: <20230227184614.70026-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patchset fixes two issues that was found when doing reboot
stress test on Malta/Boston FPGA board with various MIPS cores.

Perhaps they should go through the mips-fixes tree.

Thanks

Jiaxun Yang (2):
  MIPS: smp-cps: Don't rely on CP0_CMGCRBASE
  MIPS: cevt-r4k: Offset the value used to clear compare interrupt

 arch/mips/include/asm/smp-cps.h |  4 ++++
 arch/mips/kernel/cevt-r4k.c     |  4 ++--
 arch/mips/kernel/cps-vec.S      | 35 ++++++++++++++-------------------
 arch/mips/kernel/smp-cps.c      |  2 ++
 4 files changed, 23 insertions(+), 22 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

