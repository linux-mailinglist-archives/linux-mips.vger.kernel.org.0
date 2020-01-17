Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B59321404E6
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2020 09:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgAQILu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jan 2020 03:11:50 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:43666 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728986AbgAQILu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jan 2020 03:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rD9C3QZDVPq66OWwLFkfMJWBC5e6DghTwHl4BX8+F6E=; b=VPu106z9ozgNTCS0RAvX4vITL
        VEFKgRREs1Ryw3/kfCzj7/WnaMwSBPAnguXLRD8NAyM+7XMP3ftjNRXXm9YdcEi4JPYJ44BgQ6j4A
        OjMg7YEcldQVbdP+EIx3GHFTuuy/VzCaLNwJ+162IaWhdXBWGYbZjPb73RJzWGWDHzGNqnHnHaN5t
        04pdzIlmy7KqTdiF/8AAI/Y485V81hqNQVOAncSKYRkyrAr8kJBG9bJXs/kfatROTJJ1THI3sKilx
        FnMFsKeTPrMmK2JjkwqjqgJSqyA80qE8nO56+lmckc4AvDqSl1efcHY3JK6sgB20uGBsXKa730xTc
        JlSc8KYuw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1isMjI-0004NH-RF; Fri, 17 Jan 2020 08:11:44 +0000
Date:   Fri, 17 Jan 2020 00:11:44 -0800
From:   Christoph Hellwig <hch@infradead.org>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ide/MIPS/docs: remove no longer used au1xxx-ide
 driver
Message-ID: <20200117081144.GA16691@infradead.org>
References: <CGME20200116122951eucas1p1d36493f2b496bb13dca4fd1a17abad49@eucas1p1.samsung.com>
 <20200116122938.20789-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116122938.20789-1-b.zolnierkie@samsung.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Always great to kill off another legacy ide driver:

Acked-by: Christoph Hellwig <hch@lst.de>
