Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262002914E4
	for <lists+linux-mips@lfdr.de>; Sun, 18 Oct 2020 00:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439694AbgJQWPs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Oct 2020 18:15:48 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45929 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2439626AbgJQWPs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 17 Oct 2020 18:15:48 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id AFF915C0089;
        Sat, 17 Oct 2020 18:15:46 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
  by compute1.internal (MEProxy); Sat, 17 Oct 2020 18:15:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm1; bh=iuntMfXyof94tQmjENy9I6WaHDrv
        TLPX+YFrH+mJzg0=; b=gE/78mH91rYqtG/HzJAkLH+wipxWUgVQgjixG0JLBMG/
        ZnBo+Zaw/WzKUeMQF1b/7G/nm8EvYePEN7UBxreoD6UJLiRty3bGd8GgV1kf3m7g
        NjRiyszxmLURSlSA+6Q0V4iH8jXBuOM2sxt96EZscO/kZcq3oYTaaTI1qqY3HGst
        6SLCko1tge5EuSzFQNQCCmRUrI+RDb5R5ldi8vhCExC1jjQlFpyJQw3+t5/BgTjv
        bHC+09kyHwLyfq//OcdwAC9F//LVK0TH/laSyCUDlOvZsgflg8A1txMQ4GAqZ3vh
        F4RSrpgRFPFTU0KmR3pIO4u4VSJqaNIch4uwD+yw3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=iuntMf
        Xyof94tQmjENy9I6WaHDrvTLPX+YFrH+mJzg0=; b=o6Dslsrq6J118v6xZjKZXA
        7OaK/MWbDjCTyTDlXx9LPVAlMp1cgkpdhzCphnCOzAzzl3Trcvh2xrqefVoDvlBZ
        qmLDhKE7/ZH6wGons7wlpoOQ+6M0ypdeR0Dyu7xQLM7tb2UzX4GRgaHOGqNkNhPF
        cBV1dGH8pmPEop3gh5YbVWoorOXpVgB5zlxoeZwNVcGpUViT7G/2YEI/ya11mJlQ
        xCnAuT2zmMY86Vu8IS1H63f4VR4iHs42p7XL2Co3WdLdthWxm4cA9nhrOlmX2Mp7
        SGd7dQb03omFJd7bURC+hu+0heGdHUuMo5VXWUAO1lWgFKgrBNF3Lo+qwCwTMbcg
        ==
X-ME-Sender: <xms:Em2LX7C4WBmDA8jIafcq8ZpTXa423h8tQDunWWwPfHGh90e3_-DuPQ>
    <xme:Em2LXxjf6qpf7VGaDLT3PeH7mhhHekTjQtVxal5cb7mnQwDnFJjvKXLixQXlZ3n5i
    y2PFfxe_k6EgOz_wQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieekgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedflfhohhhn
    ucfvhhhomhhsohhnfdcuoehgihhtsehjohhhnhhthhhomhhsohhnrdhfrghsthhmrghilh
    drtghomhdrrghuqeenucggtffrrghtthgvrhhnpeffuddufeefgeffgffhvdelveduieel
    leefgefffeegieelkeeifedtvdeuhefftdenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehgihhtsehjohhhnhhthhhomhhsohhnrdhfrghsthhm
    rghilhdrtghomhdrrghu
X-ME-Proxy: <xmx:Em2LX2nl8Dsc2VD05GtBaNyWMf6V3v4-7YGP7a48lPYzxl2TACpKcg>
    <xmx:Em2LX9xvXcPYimccZVsTvAhuuW_ty0SNJ2ztLI_4UcNRwG_-8VkbAQ>
    <xmx:Em2LXwQNXEQ85KKcigRklSr0i23JT39IhD4Yg3V9vp12TMa8TmeHCw>
    <xmx:Em2LX57mA-Cv9NE7LptU2Jwi8YgOwfFjsuHUU3kK_YNfgSuUAEDQ8Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id F069A3C00A1; Sat, 17 Oct 2020 18:15:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-489-gf39678d-fm-20201011.001-gf39678d0
Mime-Version: 1.0
Message-Id: <33a813e4-f92c-4d34-a4d7-9d80203aa2fa@www.fastmail.com>
In-Reply-To: <20201015201100.4130-2-git@johnthomson.fastmail.com.au>
References: <20201015201100.4130-1-git@johnthomson.fastmail.com.au>
 <20201015201100.4130-2-git@johnthomson.fastmail.com.au>
Date:   Sat, 17 Oct 2020 22:13:55 +0000
From:   "John Thomson" <git@johnthomson.fastmail.com.au>
To:     linux-mips@vger.kernel.org
Cc:     "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mips: boot compressed: add support for vlinuz ELF DTB
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I think it would be safer to make these changes by adding a different boot/compressed target: vmlinuz.elf?
So that this would not break kernel build cases where both a normal RAW_APPENDED_DTB zImage is wanted, and additionally an ELF boot vmlinuz.elf.

-- 
  John Thomson
