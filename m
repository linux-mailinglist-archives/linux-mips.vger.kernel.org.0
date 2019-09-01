Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B077AA4B10
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 20:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728952AbfIASI1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 14:08:27 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:1828 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728496AbfIASI0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 14:08:26 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id DDAF23F773;
        Sun,  1 Sep 2019 20:08:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gBy2pZWSEmeZ; Sun,  1 Sep 2019 20:08:24 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 2AFD33F771;
        Sun,  1 Sep 2019 20:08:23 +0200 (CEST)
Date:   Sun, 1 Sep 2019 20:08:23 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 072/120] MIPS: PS2: IOP: SIF printk command support
Message-ID: <20190901180823.GB24945@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <53102a0102944d3c118f5cfc8cda3210284f59d6.1567326213.git.noring@nocrew.org>
 <97cdc04c-39b7-6d60-4e2e-2cd303fe9650@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <97cdc04c-39b7-6d60-4e2e-2cd303fe9650@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sergei,

> > +/**
> > + * cmd_printk - IOP module kernel log printk command
> > + * @header: SIF command header
> > + * @void: message to print
> 
>     @data, maybe?

Indeed, thanks!

Fredrik
