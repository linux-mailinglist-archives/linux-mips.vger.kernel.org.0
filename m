Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11BD6766D2
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jul 2019 15:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbfGZNFp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Jul 2019 09:05:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54662 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfGZNFp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Jul 2019 09:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=v25fSyTOpn+HLVJ1/RYUYjo/p2HKkKXuypllJV6JuFU=; b=FGTl2rF5Ekw99U5eWA0qO4ViY
        ezxgPoNckrfd02rKeR5DfhI5n58vJTcEz7aQ3diHZkRmGndI5Rrlekc33Ay4TibbLOwpG1XKCSloG
        82pJRxtCcnQvPslNG7xO/8DHeER9qlTWSUhlaF/iNE0YUnkdxnIGvBgg9Brpdp4iVK9JkJjbm0TvY
        TcCvfrG3NaxcqzRwVsiX1+l5U3fjf1yQEEnGnZRs2iZazrP26MkKBj4gTVChmnzy3Hz3krFh/Kx2g
        S6dj3Qi5GKN2Rfpl0jR+wq9OXeL8jT6dpW75i/Mr7cpWYS51GnMWuFS7A6xMmFALsHG7f3ly85U0p
        sDY3Ty9HA==;
Received: from [179.95.31.157] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hqzun-0004Yn-F9; Fri, 26 Jul 2019 13:05:42 +0000
Date:   Fri, 26 Jul 2019 10:05:33 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-rtc@vger.kernel.org,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        openrisc@lists.librecores.org, devel@driverdev.osuosl.org,
        linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
        devel@lists.orangefs.org, dmaengine@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
        linux-wireless@vger.kernel.org, rcu@vger.kernel.org
Subject: Re: [PATCH v2 00/26] ReST conversion of text files without .txt
 extension
Message-ID: <20190726100521.5d379300@coco.lan>
In-Reply-To: <cover.1564145354.git.mchehab+samsung@kernel.org>
References: <cover.1564145354.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Em Fri, 26 Jul 2019 09:51:10 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> This series converts the text files under Documentation with doesn't end
> neither .txt or .rst and are not part of ABI or features.
> 
> This series is at:
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=rst_for_5_4_v3
> 
> And it is based on yesterday's upstream tree.
> 
> After this series, we have ~320 files left to be converted to ReST.
> 
> v2:
>   - Added 3 files submitted for v5.3 that weren't merged yet;
>   - markdown patch broken into two, per Rob's request;
>   - rebased on the top of upstream master branch
> 
> Mauro Carvalho Chehab (26):

>   docs: ABI: remove extension from sysfs-class-mic.txt

    ^ In time: this one was already merged.

Thanks,
Mauro
