Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60E65D93EE
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2019 16:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394013AbfJPObv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Oct 2019 10:31:51 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:34705 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394117AbfJPObv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Oct 2019 10:31:51 -0400
Received: by mail-ot1-f46.google.com with SMTP id m19so20349264otp.1
        for <linux-mips@vger.kernel.org>; Wed, 16 Oct 2019 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=edtbDScedCzftAk7NNnkVZCbGagv2AScxtDF9ev1oVw=;
        b=gXSrEqX+yu6ZoF2CbsnByJ2BKlgRqfhDcu+girdlrx8IwWau5o6fENtDj+3VN9z8Rh
         WkgBhtVOVsfd/Sklz9H2yqm6Pabk7vrW6VIedR5S/+AX6yBCZFT5acx8vv8Z9glENV4i
         Eje1x/L1ZKp0XxcZyuTZjU0mFkwSiEaKNVhSfuY2TDvnFzenkkrEcfoSDgnRHFbmoavV
         hRdBkgIMxB/LKK16YZkhJWpoTBTZKhcHqeKicJp6QknJPuQ2C3ANgTGV/qn8ZRkWQtKJ
         od/rc5v9N5DV0IT+d9MR1p3bzluxPrL14GlNGHfM0ku3maBKC91Rcsf4xttG+4P8BzwZ
         80JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=edtbDScedCzftAk7NNnkVZCbGagv2AScxtDF9ev1oVw=;
        b=OssDQPOTIoo8XqA4xst4cbU7eY0x4Ay+bQxHgKaMdbse1gDpeZqgaLuZ1r9ApesNz9
         2yGk78TtHypVB0qjvCmZYUrvSzwJkcjbAFQFhKCO6JIg0QxQL2zopyrrsIX3pCh2qc+U
         uE5wh1eYxkviPj0y1KuYkLoXZfgrJc3JdKrPL+llyCYUyTwHJsj890rU8Rirm/R6/Ep6
         LgkIrFPieZ15IL4W+ydwDP1qFVH8yJ8G3gGbY6zB7ieUyBZIgqedm3kc4TAvvSWAJ9jd
         N9YOiK4c/VmraDFsSF1KzYApHkQdcP2558Go4hmlTRFIq0aMLre3YoFd1h3/iLl0wN5V
         CWAg==
X-Gm-Message-State: APjAAAV0YaCoYYy9rVpuFHRYUGlQ1QQ/Xiy0HaiL6C2M6xAyDK2K9r9j
        cDn4Ua89a5ngHxDxC/HeMrsOK1CETcegyJPyUFGnUUNu
X-Google-Smtp-Source: APXvYqxIauZHyYDzt7e+6gkCoffE9lIAaGYV1bvV8nm6b8EdtXkdyBQcdtWMakmcAEMrmbnHdrJuinOSS8nzzpNUe+0=
X-Received: by 2002:a9d:4b89:: with SMTP id k9mr18679243otf.273.1571236309683;
 Wed, 16 Oct 2019 07:31:49 -0700 (PDT)
MIME-Version: 1.0
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date:   Wed, 16 Oct 2019 16:31:38 +0200
Message-ID: <CAMhs-H93MvRBPpR2ra33wf667V_wyDmQGWY0n_rB=puq_aBGog@mail.gmail.com>
Subject: PCI support for SOC_MT7621
To:     hauke@hauke-m.de
Cc:     paul.burton@mips.com, linux-mips@vger.kernel.org,
        NeilBrown <neil@brown.name>, ralf@linux-mips.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

I have a concern about commit:

c4d48cf5e2f0 ("MIPS: ralink: deactivate PCI support for SOC_MT7621")

This commit make a regression for my kernel configuration for gnubee
board which is mt7621 SOC based and also has PCI. With this applied
PCI_DRIVERS_GENERIC is not selectable anymore and it becomes into a
PCI_DRIVERS_LEGACY configuration making impossible to compile
mt7621-pci driver for this board.

I think this should be reverted. Am I missing something here?

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos
