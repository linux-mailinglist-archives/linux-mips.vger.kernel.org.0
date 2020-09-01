Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB69F25905B
	for <lists+linux-mips@lfdr.de>; Tue,  1 Sep 2020 16:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgIAO1j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Sep 2020 10:27:39 -0400
Received: from crapouillou.net ([89.234.176.41]:45164 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728414AbgIAO1G (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Sep 2020 10:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1598970417; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=4dCf8/0XtPyUZ4cmE7yLaNcjFhJXlgKenCp5Jo5X9zA=;
        b=KF+WLRjR4DUY9ttXTgdnhizaqS4CJChRdSvWBWFT9ez6bxAjWjkckGCpzKEGDZRv+Qa/lN
        +sM87ZpMnK7FnuyS66xuQYkJ0Dn8BkuesC7Fdryh8h0w6rQQx9cSq+3VOvC2MvEhedILXH
        60UJO5bJGtLTK0/nVGAGukkecBueEec=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Terrell <terrelln@fb.com>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 0/2] MIPS: Add support for ZSTD v3
Date:   Tue,  1 Sep 2020 16:26:49 +0200
Message-Id: <20200901142651.1165237-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

This small patchset adds support for self-extracting kernels compressed
with ZSTD.

Nick:
I dropped your Reviewed-by on patch [1/2] since the code changed.

Cheers,
-Paul

Paul Cercueil (2):
  lib: decompress_unzstd: Limit output size
  MIPS: Add support for ZSTD-compressed kernels

 arch/mips/Kconfig                      |  1 +
 arch/mips/boot/compressed/Makefile     |  3 ++-
 arch/mips/boot/compressed/decompress.c |  4 ++++
 arch/mips/boot/compressed/string.c     | 17 +++++++++++++++++
 lib/decompress_unzstd.c                |  7 ++++++-
 5 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.28.0

