Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA2E1915FE
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 17:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgCXQRk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 12:17:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54444 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727436AbgCXQRk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 12:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=cJZCZxr18Eu4c8zq5s+xLC2rvrX4EDKcokEHPt7/iWU=; b=YR1js5wMW5YjUHAFs3sDPYV7gE
        8jFH6Wi8ayKebPXRPNt40wRGLAUeWYoqPWAXusE9uz0+hF8uyZtkVPanDfBr3vT9JJlcGHbK7IuVQ
        pyVcHnq4CTeOdmwwvv1ImYCRhd7HdmcUg7ImhE0q0qGzlUULCh4qQUtox7FpbLv2yjH3F9si7l/kC
        V0sEEEpW4xrKX2Qy+7i9Wf0FrYjfo8yo6FaW6r2XoWHSZUIwiEkiJxHtTsp5wuYFpLU65tMqVjl/e
        OZMDHrxsJZ3wOVHpSqGjYEbtGcpzVpiRFY1HDQYw8Cmi1s2daG++liUVxctBB6XDrcpU/Ou/h8jCb
        k8Qh73CA==;
Received: from 213-225-10-87.nat.highway.a1.net ([213.225.10.87] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jGmFG-0002sm-R1; Tue, 24 Mar 2020 16:17:39 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: MIPS ioremap cleanups
Date:   Tue, 24 Mar 2020 17:15:19 +0100
Message-Id: <20200324161525.754181-1-hch@lst.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

below is a bunch of cleanups for the MIPS ioremap code.  Compile tested
only.
