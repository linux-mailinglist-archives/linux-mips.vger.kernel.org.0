Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0A6A6B92
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 16:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729583AbfICOcp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 10:32:45 -0400
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:3759 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbfICOcp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 10:32:45 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0FAFF3F559;
        Tue,  3 Sep 2019 16:32:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HKnREz6gfMeo; Tue,  3 Sep 2019 16:32:42 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4E10C3F346;
        Tue,  3 Sep 2019 16:32:42 +0200 (CEST)
Date:   Tue, 3 Sep 2019 16:32:42 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH 094/120] MIPS: PS2: FB: Frame buffer driver for the
 PlayStation 2
Message-ID: <20190903143241.GA3595@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <4927c42fb3401c42c4c5a077f272331ac79d80b1.1567326213.git.noring@nocrew.org>
 <1003c9cc-c30e-00a7-7494-4f1cb4862e88@flygoat.com>
 <20190902144007.GA2479@sx9>
 <20190902174735.GA4339@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190902174735.GA4339@darkstar.musicnaut.iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Aaro,

> DRM drivers do provide FB console.

Great, thanks! I will look into that.

Fredrik
