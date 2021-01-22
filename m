Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393523001CC
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 12:43:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbhAVLmb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 06:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727408AbhAVLSb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Jan 2021 06:18:31 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C96AC0613D6;
        Fri, 22 Jan 2021 03:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=DdC16fxcKlTmitH5bKqjuwYdGH63cyz9+GcPj2WfxXw=; b=LyXL/9HHhP1zJjd2Py8UZPOk1Z
        crx50udB6vWXinVBRo2trgq5e3BwuIUvHeM7C/WXY9PrAwlPoi1fmAodoJT5sfUtLSUq2fL2dFfsr
        dAohHKNDA/UamzZp2E/gYKjENVVbWKx7ywJxRmH0fgW35sixt6hoSvC6d1AwAyQe4Y/i/G4d2hsL5
        bdfTg8ayhaRuSvxN3udZUfZit7rMhtm16JrkT8we0AyrPRuPwYSH7js2Eb7Xdwp1/oegtR52UN9aq
        S8AsxR/eov1+R3O5QkeB5SS63LtGz6fRNoqUskvsQ1Uc38bfaRODlV2VjeHGAyxZ2qZuMk9ZOYO6a
        Vk/EGgOw==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l2uRT-000gAa-PT; Fri, 22 Jan 2021 11:17:30 +0000
Date:   Fri, 22 Jan 2021 11:17:27 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v9] block: Add n64 cart driver
Message-ID: <20210122111727.GA161970@infradead.org>
References: <20210122110043.f36cd22df1233754753518c1@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122110043.f36cd22df1233754753518c1@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sorry for not noticing this earlier, but why do you need the bounce
buffer vs just mapping the data buffer?

