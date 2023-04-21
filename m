Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2286EB2F7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Apr 2023 22:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231396AbjDUUjR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Apr 2023 16:39:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjDUUjR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Apr 2023 16:39:17 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E82FC1BD6;
        Fri, 21 Apr 2023 13:39:14 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id C3FEF3200B68;
        Fri, 21 Apr 2023 16:39:13 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 21 Apr 2023 16:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1682109553; x=1682195953; bh=G5
        baiNIip/EtCwDIuLtcOUpxLQymRj9yAPz3xryqCiI=; b=mmDihcGhHnhrPxdxOw
        EzbUyNwOEHsybBv1V9kWN7+mzWYN2c7Jf+Y5jSOz8RMvc6UUyWik1e48BRESKYcf
        OklYCbNhQ2TCIHPkrF9mQo4ZEC+pcOljO3zo/3Ukhvymg0p7U5gnwr5Ow6xG7TFm
        R17Mgu5Jy6TGYTIAngd51jbQqI+VGbUsDptA1qG+0INu0BTSY31c5k8laaIUzYUr
        kOjXIjTnrppOI1ZQeyjHkckZvWY59QaGHATmO5nuWepbsLZAuu7+U2aExnfCBhCe
        v6wSIKs3Ajq52Ebuxi0YT6sUK03nUEGVZa6/gHlq7/6gNWWefN6Ij4DoedJ9ml7c
        e9Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1682109553; x=1682195953; bh=G5baiNIip/EtC
        wDIuLtcOUpxLQymRj9yAPz3xryqCiI=; b=Mwrg37u8XRQTiWhGNQRPceLvqklBn
        XfpaqO4rgXmDaV8DNRhh43x01e7uoUnx8E01OAEKTYAtMjfYNyUJze6mKE01t5h3
        NHbBGAiutFbF3mmryBu/+awGvUWaBHQvgT9KzXo9w/qFzutp4PBIll7E9/H2+uOV
        QrHP82W2Nb4obQf1FAdYx4AvqV+ZgtT3Tdxfg+GVloxuOJdPWvZNl6Pl/7Qfxvzf
        mvZP4uXQuxC6tqDSsih275ZC2sATBBrz7deP3Q9bKUrHwZHtfBczgm+8quMJtWW+
        9qXaH/m4ulM097nyeATHDrVnWNlmCwgO3MS4UONQKLD03aWdFmTBOhTtA==
X-ME-Sender: <xms:cfRCZOfxUh4UvRVleAB8g0sJgs65GAqZ_KyUIKDeI5J1CKvJfalfvA>
    <xme:cfRCZIOlkAlAHD_7_xgGM8jlpyXZ6cXjym4CZlsmpq9QRq0c6a4oEhvM1-Dy44oAk
    bp2WjqgdiSa6YDOKT8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtgedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:cfRCZPiCbi0iizyUCgV3DukiFw2pskRPGZFe8DTIn2pTVLZ0arrSAg>
    <xmx:cfRCZL__O7NGd6nLgFiUswzS4dCbJXwL35HtRfKR8RGKEats0kGgjQ>
    <xmx:cfRCZKtCqdpe86fbxslNjibDysaLQkDi3yuJbv7yEJ_6fDKy-nEelQ>
    <xmx:cfRCZH-WyqBJriJdN97gm2GEDtxERX6Z3NS2u7qKxETWOimOSzqyvA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E5ED8B60086; Fri, 21 Apr 2023 16:39:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-372-g43825cb665-fm-20230411.003-g43825cb6
Mime-Version: 1.0
Message-Id: <74a647f7-cf5f-4c23-aad6-77bf5b04e116@app.fastmail.com>
In-Reply-To: <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
References: <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
Date:   Fri, 21 Apr 2023 22:38:52 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Geert Uytterhoeven" <geert+renesas@glider.be>,
        "Andrew Morton" <akpm@linux-foundation.org>
Cc:     "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        "Chris Zankel" <chris@zankel.net>,
        "Max Filippov" <jcmvbkbc@gmail.com>,
        "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] libgcc: Add forward declarations for generic library routines
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 21, 2023, at 16:54, Geert Uytterhoeven wrote:
> With W=1 on platforms that use the generic gcc library routines
> (csky/loongarch/mips/riscv/sh/xtensa):
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/oe-kbuild-all/202303272214.RxzpA6bP-lkp@intel.com/
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Nice, this is one I don't have in my series,

Acked-by: Arnd Bergmann <arnd@arndb.de>

I have patches for a lot of other missing prototype warnings, plan
to send them out after -rc1.

      Arnd
