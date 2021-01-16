Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F11E2F8E4E
	for <lists+linux-mips@lfdr.de>; Sat, 16 Jan 2021 18:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbhAPRav (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Jan 2021 12:30:51 -0500
Received: from mail-41103.protonmail.ch ([185.70.41.103]:44521 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbhAPRav (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Jan 2021 12:30:51 -0500
X-Greylist: delayed 1622 seconds by postgrey-1.27 at vger.kernel.org; Sat, 16 Jan 2021 12:30:50 EST
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com [51.89.119.103])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 6B8FC2000A68
        for <linux-mips@vger.kernel.org>; Sat, 16 Jan 2021 15:03:33 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="LSNpXC3d"
Date:   Sat, 16 Jan 2021 15:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1610809327; bh=EZcb4JPboRMaIJED6qHefe7v5f3cTWgIwS+L2+WZgls=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=LSNpXC3dm6RptrTUPwvFgxXyRviBwprpEyfyXbpJ/SB1HEwiG+8pj5VWQztrLQT1k
         O5Ac0LtvC2waSTef8PpY12pNjTmyW3ZDMU7WLGbhn+QzmJiE9scuOy6NWcSubrygsg
         OMHAANZDAgeYRbThwrjb3I4AXgYTn2rWmeYQs6jYTzy9ASUnWGiGgyFxHtj0TxlQLe
         4omepypPI+WeJHviQNXjTQwlpansq1CRghc2fse3zblGnpkJJ1HrB/5ptQT3y/VWGh
         8hBRQuot4X8SJydRCnIqKgogwF/mHRZu+siUqHnKFOtxvHLpdNYsBhq/JpPwxiYHp8
         bnkQ7j0lcJX9g==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>,
        Jinyang He <hejinyang@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 0/2] MIPS: optimize relocations processing
Message-ID: <20210116150126.20693-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series converts the logics of two main relocation functions,
one for relocatable kernel and one for modules, from the arrays of
handlers (callbacks) to plain switch-case functions, which allows
the compiler to greatly optimize the code, so the relocations will
be applied faster with lesser code size.

Tested on MIPS32 R2 with GCC 10.2 and LLVM 11.0 with -O2.

Alexander Lobakin (2):
  MIPS: module: optimize module relocations processing
  MIPS: relocatable: optimize the relocation process

 arch/mips/kernel/module.c   | 109 +++++++++++++++++-------------------
 arch/mips/kernel/relocate.c |  54 ++++++++++--------
 2 files changed, 82 insertions(+), 81 deletions(-)

--=20
2.30.0


