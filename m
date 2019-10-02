Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8147C9262
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 21:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbfJBT3I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 15:29:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56336 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfJBT3H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Oct 2019 15:29:07 -0400
Received: from [213.220.153.21] (helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iFkJ8-00043W-5t; Wed, 02 Oct 2019 19:29:06 +0000
Date:   Wed, 2 Oct 2019 21:29:05 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: Re: [PATCH] MIPS: Wire up clone3 syscall
Message-ID: <20191002192904.tuit4ltadkxtyatx@wittgenstein>
References: <20191002185942.295960-1-paul.burton@mips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191002185942.295960-1-paul.burton@mips.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 02, 2019 at 06:59:49PM +0000, Paul Burton wrote:
> Wire up the new clone3 syscall for MIPS, using save_static_function() to
> generate a wrapper that saves registers $s0-$s7 prior to invoking the
> generic sys_clone3 function just like we do for plain old clone.
> 
> Tested atop 64r6el_defconfig using o32, n32 & n64 builds of the simple
> test program from:
> 
>   https://lore.kernel.org/lkml/20190716130631.tohj4ub54md25dys@brauner.io/
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Cc: Christian Brauner <christian@brauner.io>

Thank you, Paul!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
