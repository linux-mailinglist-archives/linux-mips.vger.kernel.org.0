Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928EF56303
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2019 09:17:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726901AbfFZHRZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Jun 2019 03:17:25 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37290 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFZHRZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Jun 2019 03:17:25 -0400
Received: by mail-wm1-f65.google.com with SMTP id f17so899122wme.2;
        Wed, 26 Jun 2019 00:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RERYcPC3soW1Vk8htH1oyJ3L3Gz0OePkhqi35k0/p0I=;
        b=OYdbHp6ktNPuS0z/WMYn7B2z7aZw5V6gZdgMOUxyCZTagqn4f5ClzVq4NELVY3G1qp
         Myo58k+xbuxDbfFrqJIHWc3nqEsQipwsUs1PjtNgFAqook+ApL8c6LLKaaYPs8bOCkJD
         BpQEEBVkE8HU1idCaM9tlTHsjEbdemWTB3qV5hqlHnpFuNWh3Xc2TN9zR2ulem/II+Jy
         NkNUls8ZHdL07Tb4HbhoCxPTApdB74/2KsD1LB5G8XqW7VvnqDv/45li3v1P3hg5PVFp
         fSZNP3HqKvGXM/uFLzFqcbr9659XfFLOdbgGzOwWn0h/KkzSnm46gfTi6r6acFtB+CUr
         tU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RERYcPC3soW1Vk8htH1oyJ3L3Gz0OePkhqi35k0/p0I=;
        b=H3uFMGbpxBPjAOoQ/stzrJtEDlMUBTgtXTvLDXQ72ZUJ1iHbs43Q5JfN/nUAXbNhVu
         yS5OxGaGUEsX+iVNk27RFz2/w7Kb8rpPBeyigVbzayH7iAgw2qneWith3UgueFngWpER
         CDG0eDRC+buojszTuYTWEskH9b2JafltKCjzV3k+TabcMjKhXWs1GE45v9lw0BTndNVs
         YjWv4sY9dXgFoAfekZhF0pR4GmXTkpgdPMigGMjQcfLhQPJRvJs59hZdyt0hDRvd+8nb
         WGz9jbgIdQ/9edMKDuy4kkHwm6rZNZwzeqtnifXibp2a4cse1GzD6PgKd0/S4FnLZ5aQ
         Itzg==
X-Gm-Message-State: APjAAAXJbds/PvcNw6864RQTX/+8Jqtsp/5DW+yOsN8E9Q589KOaWT8d
        SGrhjLml60lrz0LKzL5Qitjj9ESQGEmeZdPWgio=
X-Google-Smtp-Source: APXvYqwU9UitzhmKJ5t/pfR8HxsTFi/sqtvSVbTXtdDxS2SooK3ATbTGPoFE8wuP0Gr+BGzKdjZRLixWxlUEFzSUG/Q=
X-Received: by 2002:a7b:c313:: with SMTP id k19mr1470647wmj.2.1561533442305;
 Wed, 26 Jun 2019 00:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190625121321.10197-1-hch@lst.de>
In-Reply-To: <20190625121321.10197-1-hch@lst.de>
From:   Manuel Lauss <manuel.lauss@gmail.com>
Date:   Wed, 26 Jun 2019 09:16:46 +0200
Message-ID: <CAOLZvyF0NsB6_e0=Vat48Mq1r-Qy45z509jAgQczG7RoaOqjBA@mail.gmail.com>
Subject: Re: [PATCH] au1200fb: don't use DMA_ATTR_NON_CONSISTENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux-MIPS <linux-mips@vger.kernel.org>,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 25, 2019 at 2:13 PM Christoph Hellwig <hch@lst.de> wrote:
>
> au1200fb allocates DMA memory using DMA_ATTR_NON_CONSISTENT, but never
> calls dma_cache_sync to synchronize the memory between the CPU and the
> device.  If it was use on a not cache coherent bus that would be fatal,
> but as far as I can tell from the naming and the mips platform
> implementation it always is used in cache coherent systems.  Remove
> the DMA_ATTR_NON_CONSISTENT flag, which is a no-op in that case.

Very early au1200 chips, on which this driver apparently was developed on,
had issues with cache coherency, but this was fixed in a later step,
none of the 3 steppings I have access to exhibit any problems
with this patch applied.

> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-By: Manuel Lauss <manuel.lauss@gmail.com>
