Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 966953D2443
	for <lists+linux-mips@lfdr.de>; Thu, 22 Jul 2021 15:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232069AbhGVMX4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Jul 2021 08:23:56 -0400
Received: from verein.lst.de ([213.95.11.211]:34159 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232122AbhGVMWz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 22 Jul 2021 08:22:55 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 951C768CFE; Thu, 22 Jul 2021 15:02:41 +0200 (CEST)
Date:   Thu, 22 Jul 2021 15:02:41 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Brian Cain <bcain@codeaurora.org>,
        Chris Zankel <chris@zankel.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Helge Deller <deller@gmx.de>, Jeff Dike <jdike@addtoit.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michal Simek <monstr@monstr.eu>,
        Richard Weinberger <richard@nod.at>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        uclinux-h8-devel@lists.sourceforge.jp
Subject: Re: [PATCH v3 8/9] asm-generic: remove extra
 strn{cpy_from,len}_user declarations
Message-ID: <20210722130241.GH26225@lst.de>
References: <20210722124814.778059-1-arnd@kernel.org> <20210722124814.778059-9-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210722124814.778059-9-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jul 22, 2021 at 02:48:13PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As these are now in asm-generic, it's no longer necessary to
> declare them in the architecture.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
