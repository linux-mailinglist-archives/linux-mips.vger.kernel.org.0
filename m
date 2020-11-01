Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB962A1EE5
	for <lists+linux-mips@lfdr.de>; Sun,  1 Nov 2020 16:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726499AbgKAPLX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Nov 2020 10:11:23 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:47760 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgKAPLW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Nov 2020 10:11:22 -0500
Date:   Sun, 01 Nov 2020 15:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1604243479; bh=5iJ0E5e0R3nJzOnM1jd4trfBZrT4w2G6VPCCONJqXHs=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=j75o185HmXDi1mbpGazoz7+2W8dyJUzT6lkr8wz7TjgDy6d95bWpMvtKP1PtOYQNq
         BsfeU9i2+MMUOq1Q0TCwy2jekInmwGziRGNFtE6ZDAhOqFs6JqI6Pi9djHDPe105r+
         fkIO3HXNrjC0Af+gSpozT4pkTLj4h01PPm8yZIBhP4QvbO3eN5BD8iy+F4gmmR/GBz
         1Rjgwc4uBB//OUk6Q0/p9VWrvbpzVyI5HybtQLHqwS95+7F+dCEQUMDzKcrtBVm59b
         xUrqKnED2e08EAKJLI8z6XoM231gw8y3UMdGcxHPOarYOHtugBQ/ebyOj2t8LpWzQ4
         AZr8lf177ltgQ==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 0/2] mips: boot: add support for self-extracting FIT images (vmlinuz.itb)
Message-ID: <WnsVNeMB9c330hqKGdZ32JHsKO2ZbTM1BOGv74ZSJ9o@cp4-web-014.plabs.ch>
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

Commit c3e2ee657418 ("MIPS: generic: Add support for zboot") added
support for self-extracting images to Generic MIPS. However, the
intended way to boot Generic MIPS kernels is using FIT Images and
UHI boot protocol, but currently there's no way to make self-extracting
FIT Image (only legacy uzImages).

This set consists of two parts:
1) various cleanups in arch/mips/boot/compressed/Makefile as a
   prerequisite;
2) a new target named "vmlinuz.itb" for composing self-extracting
   FIT Images, which allows to have the advantages of both UHI and
   vmlinuz.

The second part involves some scenarios duplication, but I think it
can be a subject for another series (for constifying and unifying
FIT Images rules across the architectures).

Alexander Lobakin (2):
  mips: boot: clean up self-extracting targets scenarios
  mips: boot: add support for self-extracting FIT images (vmlinuz.itb)

 arch/mips/Makefile                 |  3 +-
 arch/mips/boot/.gitignore          |  1 +
 arch/mips/boot/compressed/Makefile | 96 +++++++++++++++++++++++++-----
 3 files changed, 85 insertions(+), 15 deletions(-)

--=20
2.29.2


