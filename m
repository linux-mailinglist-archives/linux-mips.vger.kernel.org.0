Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F47726156B
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 18:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732129AbgIHQtE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 12:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732029AbgIHQsj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Sep 2020 12:48:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C611C061795;
        Tue,  8 Sep 2020 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=xF9RZXKA4EiFQUj/JjM3EuzJl40Uj2VLvNxxwGRDZAM=; b=gayIdn2gK+0gbWA1zyBuj3iada
        IKI16aUVs7hClZF1g624+hDQCEhOhIbApmzMhIX3IugyJOkjf73Alpxq1u+MtbXB1QbxV689L6wQR
        ci8FG0MGPZ4m2u7d9Nis5Mgwq2wjBI26LGSoT9WB1x4wsDBAoqWxO4lrVEUh8bTKnff0SvKSy1Fu9
        bZODj62rBjTrCLl0nkzs01w4pcf5hPbKUKaw04pL1L84DHpCFMZO5zSaxiI9UL8DUYmelJnc18d8s
        dxYK5d+pmLGpCE+Czj43MZha4MWRRMnMXOUB3BzLLa7o43YHV5mRCEqZwXa0Q9zzK6UgJprb7n6Pk
        uri4M/Dg==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFgmk-0001Qw-Tu; Tue, 08 Sep 2020 16:47:59 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: dma-mapping cleanups
Date:   Tue,  8 Sep 2020 18:47:46 +0200
Message-Id: <20200908164758.3177341-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

this series contains just the cleanup parts from the previous
"a saner API for allocating DMA addressable pages" series.  The
intent is to get this in to reduce the amount of patchbombing
for iterations of the real API work.
