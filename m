Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D995E34CD19
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 11:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbhC2Jaq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 05:30:46 -0400
Received: from elvis.franken.de ([193.175.24.41]:33856 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231882AbhC2JaY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 05:30:24 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lQoE1-0003qb-06; Mon, 29 Mar 2021 11:30:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 94A85C1D90; Mon, 29 Mar 2021 11:26:48 +0200 (CEST)
Date:   Mon, 29 Mar 2021 11:26:48 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc:     davem@davemloft.net, herbert@gondor.apana.org.au,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, ardb@kernel.org
Subject: Re: [PATCH v3] crypto: mips: add poly1305-core.S to .gitignore
Message-ID: <20210329092648.GF8484@alpha.franken.de>
References: <20210328014052.8645-1-ilya.lipnitskiy@gmail.com>
 <20210328023943.15540-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328023943.15540-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 27, 2021 at 07:39:43PM -0700, Ilya Lipnitskiy wrote:
> poly1305-core.S is an auto-generated file, so it should be ignored.
> 
> Fixes: a11d055e7a64 ("crypto: mips/poly1305 - incorporate OpenSSL/CRYPTOGAMS optimized implementation")
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/mips/crypto/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 arch/mips/crypto/.gitignore

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
