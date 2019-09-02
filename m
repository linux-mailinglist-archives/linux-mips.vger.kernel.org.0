Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE47A5987
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 16:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731524AbfIBOkK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 10:40:10 -0400
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:35476 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731519AbfIBOkK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 10:40:10 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 64E51417AD;
        Mon,  2 Sep 2019 16:40:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Sqv5eylgobSW; Mon,  2 Sep 2019 16:40:07 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 97ACB41797;
        Mon,  2 Sep 2019 16:40:07 +0200 (CEST)
Date:   Mon, 2 Sep 2019 16:40:07 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 094/120] MIPS: PS2: FB: Frame buffer driver for the
 PlayStation 2
Message-ID: <20190902144007.GA2479@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <4927c42fb3401c42c4c5a077f272331ac79d80b1.1567326213.git.noring@nocrew.org>
 <1003c9cc-c30e-00a7-7494-4f1cb4862e88@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1003c9cc-c30e-00a7-7494-4f1cb4862e88@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun Yang,

> According to kernel policy[1] no more new FBDev driver would be accepted.
> 
> Please refactor it to DRM.

I had the impression that the DRM does not support a kernel console?

Standard hardware, on its part, does not have a serial port or similar
alternatives that could easily function as a console, unfortunately.

Fredrik
