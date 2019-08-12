Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8187895C6
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 05:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbfHLDbc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Aug 2019 23:31:32 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54916 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbfHLDbb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 11 Aug 2019 23:31:31 -0400
Received: by mail-wm1-f68.google.com with SMTP id p74so10818650wme.4;
        Sun, 11 Aug 2019 20:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=015uEYjEdFgD5EcbxQBzasE/Mke0/bgRh00o9GHZva0=;
        b=jtsyS+GKKbqKmghu64eDI2F1Aeep7vqC9zE/KMpc5cqLWd34Iln43ty2Cxqqlz0o/+
         C4aPiXYqEElm2adXiPv5rlP8FcCVO1RNmIQ+wsyd6P/4DtcXimsoF4HdhpV+q8PtZVyL
         fSjnd3psn4H6BkMa6NI2QeAlKPL/4xdc7kiPtkO9D2wnFAm9ieDtWBo8rk/HU40IxwuA
         XSoup8kYS/UZEMiioIyZGHm5XRlmrnW58FzN+JpzDrMQTWlQAxPeGl0FLjqd0G2yDoZy
         mpHpsdxDt9G0kd8hWSf5NFMJWsZvppAgNuDbSMMJhrozUCEsZ0mUyrW2/ZSWbhE/raIi
         HCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=015uEYjEdFgD5EcbxQBzasE/Mke0/bgRh00o9GHZva0=;
        b=r/DQ4QWBK61jS4SZuc5VqM935u8DaAyoZUqgLv1j2W9IheeaNkqAO8hYiU6RF7VGN3
         MVTqTiweUJPe/XzExl9GiFDwYGHpJpHvYPfksJbjBOxMX32U5IAOP4AqpoJ3EYUkto1q
         RAsWWe6s22ICuY8lt6I+a8hgvckChW1CuctKVYcntGR02+/pzaIseNkiHdfGnDjYq+kB
         512BApGZHzRGHwrn7oAjTOfSIxbqTC2YT2Ty/OCnTa/Wi9YMgBeOP1Y15HI5DjAPk48P
         89EpV0p3NfAuf7r+iyw+pZgZiWBCUKqjuX/EeCkIzA36jWnlWlydUm2IdMomY429ooy7
         LqEw==
X-Gm-Message-State: APjAAAUy5BO+Ba8Gv9kI1rSjMyJpJ7b5GdUIqXdzcNrtai8KDyTSDJe6
        H4KdocEugG++1ibU2qcDCjU=
X-Google-Smtp-Source: APXvYqxRUsxYZMPAuPrcrVcfyJ7/tHaLnIxk1G1NYOYUcaFHtmfLSznscq6JYbjhRb3bD6JzPwl5wg==
X-Received: by 2002:a7b:c8cb:: with SMTP id f11mr11575599wml.138.1565580689506;
        Sun, 11 Aug 2019 20:31:29 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id f12sm117299330wrg.5.2019.08.11.20.31.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 20:31:28 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: [PATCH 0/5] Clang build fixes for MIPS
Date:   Sun, 11 Aug 2019 20:31:15 -0700
Message-Id: <20190812033120.43013-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

As of clang 9.0.0 at r366299 [1], we can build a QEMU bootable
malta_defconfig kernel with the following fixes (mostly due to -Werror)
and Nick's patch [2]. This has helped catch some potentially dubious
behavior with -Wuninitialized, which is stronger than GCC's
-Wmaybe-uninitialized.

If there are any comments or concerns, please let me know.

[1]: https://github.com/llvm/llvm-project/commit/7f308af5eeea2d1b24aee0361d39dc43bac4cfe5
[2]: https://lore.kernel.org/lkml/20190729211014.39333-1-ndesaulniers@google.com/

Cheers,
Nathan


