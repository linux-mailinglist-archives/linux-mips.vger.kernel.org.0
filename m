Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEC02E69FC
	for <lists+linux-mips@lfdr.de>; Mon, 28 Dec 2020 19:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgL1SYM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Dec 2020 13:24:12 -0500
Received: from mout.gmx.net ([212.227.15.19]:54067 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728765AbgL1SYM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Dec 2020 13:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609179760;
        bh=iPKgnR4rClLp6boRcyUZCRK/hfFGrpqUcqzKe90pZv0=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=XXLqZ8tT78GzPI3HNnlhVWeHhhdpUng3G2sdysSXpYZwZXKjo69U/AoriRWTKxXR5
         LCpBuPAjuMj8ah2+JjQ1g+2N/cCqGMEGixQkn/ifLZeyiYgjKghVjyn3rJMAxU/wcE
         dDo+R6dd6Rt7zmO+2HwGN21WVe80bdhNDUVkRmow=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mv31W-1k3MZr3zvM-00r3MT; Mon, 28
 Dec 2020 19:22:40 +0100
Date:   Mon, 28 Dec 2020 20:24:16 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 3/6] fbdev: Add n64rdp driver
Message-Id: <20201228202416.1b624c273a442334a207080a@gmx.com>
In-Reply-To: <20201228105034.GB3606@alpha.franken.de>
References: <20201225190048.776de55443fd4c953e797d8e@gmx.com>
        <20201228105034.GB3606@alpha.franken.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:2+o/8u2HWbNbH2TOlND3SbfPkrl664ndQL2EYQWC7ll3SK50v2x
 pllz27Sl5tF1KnEujqpwblCw6eOhCSSmvYd13PwkPgUE9KbceQV82EFWzyoHAUnHhaPFx14
 2ZM3QAcUVoBrN0Vtt8EG3Uu9d9aqUbDRYlCkAMe2h/T4golVMzJif5/+VaknoRExChMbcLj
 z+LOhqYXJIPDsQqORR6HQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6ln9CUwIlwo=:MSDYCdBdJTJfsNojrIb7nA
 GTdMHYPbRgxnXz0pvK8I0jStOpw/PU0kRbkoHtJOyrNlVIxGn5rWJvhW60ZtcptVf2uJestEX
 eSAQ/3+EseeJmAa7Rk6+hYmS1xUxsxKlRa8DtCJi+2SgTTnESOV9KU7JCUHYoyzwVD7/WKnnt
 ywSZd7ym/UOrH5PbCMfWDQ0iGARdRz7P3iI15hoCYpHMb4NutVgSAmuHAZ+24Wgpwsl3+Iip8
 oKaOhVcfDSWZNIu3FKgtzctF3z04d3VycM6DPPXF/PLrOnOdPzeMTVWLYWDqxdICDlneKqJzw
 bXlTaZml8JTE3NRxp63G8z8Sm89j4J8yRGDLEb7qtshFaYf0fW54sUozWbqpC09d91qomdeEB
 wAoR1zbtllEeAhuFahisG21UCgW4sYUGXxWz+4oYB3SiYePt6Sq6Y7yhIlSaWpG4/8mbsxpqz
 nEwglaaxfbIe1/bSAOiDeV4CxyRwpdWmZ36ejPXToBIf+cv19/p3FaaAM3qwFoTnJdQUHdy6D
 c5I4tm8B4XOwMUhNsOXHLEoHSS6yrLd0J4jMB68MD4H/eex5wsyVjznkn/+Gzcj+N1LY4/w1f
 OoyusKT4nwl5CAfCfAIg0tDsiTFWrWHdAX1abtNtZOUndcGc3MWAcECrvcZ8LL1km/Qepqbvc
 i/6CUbSfwngCXIGOMTwVUI8WzFE4qJRG92XNvg7OI+gZ7hREne9QtDqJ+SNFhOGmqSaDe/PyR
 Gzw4QmwQS/Ja3e8v1a9GK4F20foareR47ba28YweuHd9nQmC6KKrJHO6TqB0BL/lWcal8ydFA
 iDKTxVJs5w9bnRNvrAdbQDlIySW0GeWrJHuEXScyU+fNHxgrdioj7fXWr3qkIA5hw1mSR6s9h
 ks23WJwmsijIBHc6Cwgw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Do I understand correctly that this is a "yes" to the "is it worth it
to upstream a port for a platform this ancient"? You being the MIPS
maintainer.

- Lauri
