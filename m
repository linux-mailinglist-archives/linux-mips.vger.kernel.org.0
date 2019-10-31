Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 314E1EB9E2
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2019 23:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbfJaWqF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Oct 2019 18:46:05 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38763 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727477AbfJaWqF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 31 Oct 2019 18:46:05 -0400
Received: by mail-pf1-f194.google.com with SMTP id c13so5517799pfp.5;
        Thu, 31 Oct 2019 15:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:subject:references
         :in-reply-to;
        bh=QVItefipwjGqrppuci+M+vM6162XpV9VZniQZODk/Ko=;
        b=X65wtPTQII92rF3v9iJx/Y/4nyjoC6GonHOKSp1f3WzvVNGq2Jlh5oL1hi8eT0RnDZ
         jMEJJ5rJ3+vPkKV/XCSxv84zMBNh9ppTKARKDpD/3iv2BbFYGBkEgTmmSKH7w8DvrnIu
         uenDtxGJIWyijgA14i99QNQd05yK6dJhsvtzI0ih3YBJVR1Iy6wAFUc13dIGaAeAoUcA
         UDtBJPFuRMcWB+E8IaHf1iUD2w98LD0eC8FZRv4v1ycNom47TRHEdErfPSowXswfSkC7
         uZ3WHyBGON5PnPsG8TfQvg7AVcrFXR00HL+MfP9YaoZfwQaB84nvMtMNRMoU3BjMzOXl
         VuCw==
X-Gm-Message-State: APjAAAUp4FWk6NVJ8yqyrmNYwpOoMa+FdQJuWpzIs04fx8sS+M+Go8Vg
        B4LXeJmt3i+iaJ4QEXPnbBg=
X-Google-Smtp-Source: APXvYqynmCI1j0rBTGTVR35qYJ2EdUO7wxgQliAe5zq8TQKKAW6SVW2TfhSo+ap3b8ItfcbM18Saqg==
X-Received: by 2002:a63:c442:: with SMTP id m2mr9270433pgg.67.1572561964317;
        Thu, 31 Oct 2019 15:46:04 -0700 (PDT)
Received: from localhost ([12.94.197.246])
        by smtp.gmail.com with ESMTPSA id e1sm3996126pgv.82.2019.10.31.15.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 15:46:03 -0700 (PDT)
Message-ID: <5dbb642b.1c69fb81.fa7a7.be3f@mx.google.com>
Date:   Thu, 31 Oct 2019 15:46:02 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: SGI-IP27: fix exception handler replication
References:  <20191031094605.12380-1-tbogendoerfer@suse.de>
In-Reply-To:  <20191031094605.12380-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> Commit 775b089aeffa ("MIPS: tlbex: Remove cpu_has_local_ebase") removed
> generating tlb refill handlers for every CPU, which was needed for
> generating per node exception handlers on IP27. Instead of resurrecting
> (and fixing) refill handler generation, we simply copy all exception
> vectors from the boot node to the other nodes. Also remove the config
> option since the memory tradeoff for expection handler replication
> is just 8k per node.

Applied to mips-fixes.

> commit 637346748245
> https://git.kernel.org/mips/c/637346748245
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
