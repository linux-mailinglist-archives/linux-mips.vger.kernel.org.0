Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53A0318F5D
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2019 19:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfEIRje (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 13:39:34 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59068 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfEIRje (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 May 2019 13:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=GUcwVt88gpVqJwFXSEww+OxTilIQfKDCwAE+rwYnUs0=; b=BHm4+bSXUCpzMOJEIpmMx6QXb
        vNaj13uXhlnT39b/MrRrOYAFLh1H/A0GJE5HfjcrZ+k17Npys4ktzcM35ES2OXje2KBv+ZhczI2K3
        t26Dupejm41mlXPZB9X1A67EM2DOgzCI5jA2JGzIhODbQhXuNwBmOMGfV84X5pAG90h1XJaW3gHFL
        hdhe6eif/XGSiiYi15uCUtSbcPJX6YfFiRxX5/3YMWMpmV9mwEfYEmVklvPTfgCQjZdjFpDzBgM+3
        wVjq/xOdMzHcqy9i3E6eSW+EekPxo98P/7Ua6mguBtizkUqmc0aYDhnZTS8a97wy3t6D/sPgLzI6h
        sLhn2WFRA==;
Received: from 089144210233.atnat0019.highway.a1.net ([89.144.210.233] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hOn10-0005KD-U5; Thu, 09 May 2019 17:39:31 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: fix DMA API abuse in various mips fbdev drivers
Date:   Thu,  9 May 2019 19:38:46 +0200
Message-Id: <20190509173849.11825-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

this series fixes up three mips-specific fbdev drivers to not poke
into the return values from the DMA memory allocators, as those
aren't guranteed to be pages backed (although on mips in practice
they are).  Two of them are also fixed up to use the proper DMA API
mmap helper.

Note that the first patch is required for pending mips DMA changes,
so if they are queued up for 5.3 we'll need a stable branch that
can be pulled into the dma-mapping or mips tree.
