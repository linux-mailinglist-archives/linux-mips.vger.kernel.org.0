Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B302E2CF4
	for <lists+linux-mips@lfdr.de>; Sat, 26 Dec 2020 04:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgLZD3x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Dec 2020 22:29:53 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:54649 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725994AbgLZD3x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Dec 2020 22:29:53 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id BBE3058039D;
        Fri, 25 Dec 2020 22:29:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 25 Dec 2020 22:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=x
        z5rxPLOCXBYyV9tPq/gMYVXGNO+m0MqUEDl+UWbOZA=; b=m4Y0P1nMJMXflnI4k
        NBPSKxaBfSnpyiaxJy8SKbTwNuTHaMYUbPqnlS3XNSSW52NXFhqwAjIg9EFVGAQT
        zb5zK6LiWRJFsAH8BLEeUIZLpvqbPZIE/rTlWu//R1N/QR4r1P64YVz+I2wssZuH
        y3Topzkri+h+lTB6kcpgxNcQiue+e7FVAjfhY4H37ejFi1pCx8p/YCllww91rh0n
        CdpK8qR0cfgf23CaBeAQ2MZnqPGw3jE6AwQrl9K/t1K4LeX+v5vpEMyoHaHYgV0b
        pckKWxSB4/XDQW236KrXUpP8oUKId6NvXOiHkQN+ynKzcEn2fQFrcC7FW2QgNq3O
        bMQ2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=xz5rxPLOCXBYyV9tPq/gMYVXGNO+m0MqUEDl+UWbO
        ZA=; b=A/YMKM8R7eURN9APATjMfVMPuVycsi/XbkpyVpTQaH9u17Ey9voNu3fnp
        VsHkM0GIw2cUSgD/byfCj6CoXN3kVeBl90Z1qBBEFbvfCoXoXreXFrl9zrE6UQBm
        h6+XHv0hDUvMV3jHkuDvnUeqmTQXWAdWq4Jdqn6B24iP7wlkQD9dnWgCQm5i0qFE
        qVfhH4P2HL90ooZqerRO52UQQKBmLWZ2o+K/ThEe4uuxjWuNBarqaOXt6diOtxkV
        VnqTisfF6qJQAwnu/yH2ZUWtEp/cFcGJTmr8bLUsnxKcicQ+QVyb8TgnBFC7xF7G
        cZtUF54IWV+0BhH+btywI/3t06y5g==
X-ME-Sender: <xms:Aq7mX-4pGTnuaiTDBMJJvynQ7UbXLRF1V9y-qieW2oCugL7vNUtFLA>
    <xme:Aq7mX37KwD70SYjHhV2NsPucp3H12aC_BEULGwxcTLDmRIm1EGQ10V663j6gvDUf2
    0w5imcuL_23ajoIFWU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdduvddgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepkeeijeehgfeileejle
    elfffggffhtdfgtddvgeetleetfeeiffdttdegieffffeunecuffhomhgrihhnpehlihhn
    uhigqdhmihhpshdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppeeghedrfeefrdehtd
    drvdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Aq7mX9fDi9XTPyc3B7yn950laq2QSNZf_4nOApB7sIHPPekiGpE9wg>
    <xmx:Aq7mX7L4jL-23utMtP7KCTPqtWsuhEg2ZG-3Wf1WQ-MdwYqJ2rMKkg>
    <xmx:Aq7mXyKU0RLgeF9kZ5ABynyhGtJ6E8SGe1kTH5Q2SPLdVclgKjzbKA>
    <xmx:Aq7mXxmPmMryzW3PeQtJ2fJTejLq4py5NxgNnkYqVREkuqxP9GWLysYknfw>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 10DAC240057;
        Fri, 25 Dec 2020 22:29:04 -0500 (EST)
Subject: Re: [RFC 0/6] Nintendo 64 Linux port
To:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
References: <20201225190503.12353218812e1655f56f0bf8@gmx.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <43076b53-4eb2-164d-3b5d-dde7dfedbe94@flygoat.com>
Date:   Sat, 26 Dec 2020 11:29:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201225190503.12353218812e1655f56f0bf8@gmx.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2020/12/26 ÉÏÎç1:05, Lauri Kasanen Ð´µÀ:
> Hi all,
>
> Here's a port for the Nintendo 64.
>
> At least two people have done such a port before, but didn't submit.
> This is not based on either.
>
> RFC because I'm not sure if it's useful to have this merged. Old,
> niche, and limited platform.
>
> "But why", I hear from the back. Having Linux available makes it easier
> to port emulators and fb or console games.
> www.linux-mips.org/wiki/Nintendo_64 can be edited to no longer say
> "vaporware".
> Most importantly, because I can.

Yes you can :-) and Linux can!

>
> There's a ready ROM at https://github.com/clbr/n64bootloader/releases
> for folks with a flashcart to play with.

Is it possible to test it with N64EMU or something?
Just grab out my N64 out of garbage but unfortunately it nolonger boot....

Thanks.

- Jiaxun

>
> - Lauri

