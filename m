Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F28734015
	for <lists+linux-mips@lfdr.de>; Tue,  4 Jun 2019 09:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfFDH1d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Jun 2019 03:27:33 -0400
Received: from verein.lst.de ([213.95.11.211]:33787 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726697AbfFDH1d (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 4 Jun 2019 03:27:33 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id A57CC68B02; Tue,  4 Jun 2019 09:27:06 +0200 (CEST)
Date:   Tue, 4 Jun 2019 09:27:06 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Khalid Aziz <khalid.aziz@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andrey Konovalov <andreyknvl@google.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 01/16] uaccess: add untagged_addr definition for other
 arches
Message-ID: <20190604072706.GF15680@lst.de>
References: <20190601074959.14036-1-hch@lst.de> <20190601074959.14036-2-hch@lst.de> <431c7395-2327-2f7c-cc8f-b01412b74e10@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <431c7395-2327-2f7c-cc8f-b01412b74e10@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 03, 2019 at 09:16:08AM -0600, Khalid Aziz wrote:
> Could you reword above sentence? We are already starting off with
> untagged_addr() not being no-op for arm64 and sparc64. It will expand
> further potentially. So something more along the lines of "Define it as
> noop for architectures that do not support memory tagging". The first
> paragraph in the log can also be rewritten to be not specific to arm64.

Well, as of this patch this actually is a no-op for everyone.

Linus, what do you think of applying this patch (maybe with a slightly
fixed up commit log) to 5.2-rc so that we remove a cross dependency
between the series?
