Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F2E1234FC
	for <lists+linux-mips@lfdr.de>; Tue, 17 Dec 2019 19:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfLQSfN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Dec 2019 13:35:13 -0500
Received: from verein.lst.de ([213.95.11.211]:60115 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfLQSfN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Dec 2019 13:35:13 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id ECFA468B05; Tue, 17 Dec 2019 19:35:10 +0100 (CET)
Date:   Tue, 17 Dec 2019 19:35:10 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: RFC: kill off ioremap_nocache
Message-ID: <20191217183510.GA32372@lst.de>
References: <20191209135823.28465-1-hch@lst.de> <CAADWXX9zEBT-NPCwE09D+6=8iCZ+kCmdyXoGrTKhnmYn82XEJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADWXX9zEBT-NPCwE09D+6=8iCZ+kCmdyXoGrTKhnmYn82XEJQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I've pushed this out to the for-next branch and thus linux-next.  Let's
see if anyone screams.
