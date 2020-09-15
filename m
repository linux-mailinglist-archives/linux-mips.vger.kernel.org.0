Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D3526B183
	for <lists+linux-mips@lfdr.de>; Wed, 16 Sep 2020 00:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbgIOWbC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 15 Sep 2020 18:31:02 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49363 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbgIOQRV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 15 Sep 2020 12:17:21 -0400
Received: from ip5f5af089.dynamic.kabel-deutschland.de ([95.90.240.137] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1kIDcz-0007gI-EM; Tue, 15 Sep 2020 16:16:21 +0000
Date:   Tue, 15 Sep 2020 18:16:20 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christian Brauner <christian@brauner.io>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-xtensa@linux-xtensa.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 15/15] selftests/seccomp: Use __NR_mknodat instead of
 __NR_mknod
Message-ID: <20200915161620.br27aooq5j7dk4ug@wittgenstein>
References: <20200912110820.597135-1-keescook@chromium.org>
 <20200912110820.597135-16-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200912110820.597135-16-keescook@chromium.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 12, 2020 at 04:08:20AM -0700, Kees Cook wrote:
> The __NR_mknod syscall doesn't exist on arm64 (only __NR_mknodat).
> Switch to the modern syscall.
> 
> Fixes: ad5682184a81 ("selftests/seccomp: Check for EPOLLHUP for user_notif")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

Thanks! Looks good.
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>
