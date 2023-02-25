Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE6B76A2C01
	for <lists+linux-mips@lfdr.de>; Sat, 25 Feb 2023 23:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjBYWKv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Feb 2023 17:10:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjBYWKu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Feb 2023 17:10:50 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21D1144B1
        for <linux-mips@vger.kernel.org>; Sat, 25 Feb 2023 14:10:48 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 270085C00E3;
        Sat, 25 Feb 2023 17:10:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 25 Feb 2023 17:10:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :message-id:mime-version:reply-to:sender:subject:subject:to:to;
         s=fm2; t=1677363048; x=1677449448; bh=7H3xOCblkx8u2nNkjAYxyVG6H
        wUZpn5p6UZRiNlKWIU=; b=Q4ojiYDZbQH/OMwuM0gsH006YEao9TEpt2hQMwGlB
        bcHoycCaKfo4RabKvXmoKhpRULSiXMT2Jgl7AZDq7pHwZ7obDIAnDkttjsbjoW3d
        STXDjypg4Ymk12Boz2BmKvIz5Yg+YDQGwE1IgnJ/2VoKAQ+xHjuC3uzpKyrvHfy6
        ksYXngtjpTKGld0VItO7Ve2xODFQlyB6+S8hezGYIl/r7lJhxDQuMfLh13Ou9pDA
        QbnqCoHWmvgCpoG+CG2Bn0PVbrH7e25NgQHLqUPiqsdm3HwcjSg3whcE4pzHeFkN
        3VBJUJQZpE1kxQqitx5mgbW61cNmvjy7nA2LSZ0wnkFog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1677363048; x=1677449448; bh=7H3xOCblkx8u2nNkjAYxyVG6HwUZpn5p6UZ
        RiNlKWIU=; b=HhmNndd+iKf7V1/Qy9dA0RRVGYXlYjJFA+UopeNb2NivbGaY8y9
        /SStX1TjqzPpl/YXcaQWAi0+SZcGFJf0bI62CjJMwUI+lP/plpHp8q+D6UG+4Nbl
        6WN+hLcTFGwjJmPFBk7K88ao9800UXeQVNEvUnuMRIH3nT0PymLEitGOfhyXL3do
        u77bhfdoIYgST3By770tE0sJ/WRvHfDPlrQdMUtk3Ci/ji1+RbRrMC5OYdRJQQX2
        KX1ycrFoX2FcaboTQNUvVhmwSkC1sJ5L0lO1QPA3PeO8EYgtW/lGCfkeK5FTzUuR
        e6NVLooQ1VZ7KRA0auKO4W4iQAReYlM1wzw==
X-ME-Sender: <xms:Z4f6Y8eb53O8aRgJ-CMHXWiNrxfeKRstYF59M1aJEw05PoYfadN9rA>
    <xme:Z4f6Y-M5_OTMoF7qvAulqHiyf_8NnyQoxAbwDD8OJArOTH4cjoKON9T9Abyq6oMkU
    Oa2zyijljDUz76UsCY>
X-ME-Received: <xmr:Z4f6Y9jvCkqD4rgJoYDdvBW0rLU1PrlTK7pEQ49Tlkw4bbGF6YrkHnRj-_9a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
    ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
    grthdrtghomh
X-ME-Proxy: <xmx:aIf6Yx-bJwr74YD55_Ej3tjSYQ278OEkwQcpk8ePEBQlidxhEk4QIA>
    <xmx:aIf6Y4uqEgcY0fdr_fP6g4pkuV37k5xbZdGzsnH7CjqtkN8cqiSwSQ>
    <xmx:aIf6Y4EbNgvrHHapoOVJAoweEWjvv1BLAQcPLHyw5nwmpXAdwtqekQ>
    <xmx:aIf6Y1VLRbAJKHf00-uAGyF4BNAgD-EnCyYK-ZuW-glCAkBkp8MsdA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 17:10:47 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] MIPS Booting fixes
Date:   Sat, 25 Feb 2023 22:10:06 +0000
Message-Id: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

This patchset fixes two issues that was found when doing reboot
stress test on Malta/Boston board with various MIPS cores.

Perhaps they should go through the mips-fixes tree.

Thanks

Jiaxun Yang (2):
  MIPS: smp-cps: Don't rely on CP0_CMGCRBASE
  MIPS: cevt-r4k: Offset counter value for clearing compare interrupt

 arch/mips/include/asm/smp-cps.h |  4 ++++
 arch/mips/kernel/cevt-r4k.c     |  3 +++
 arch/mips/kernel/cps-vec.S      | 35 ++++++++++++++-------------------
 arch/mips/kernel/smp-cps.c      |  2 ++
 4 files changed, 24 insertions(+), 20 deletions(-)

-- 
2.37.1 (Apple Git-137.1)

