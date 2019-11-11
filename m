Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0F32F807E
	for <lists+linux-mips@lfdr.de>; Mon, 11 Nov 2019 20:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbfKKTvg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Nov 2019 14:51:36 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38698 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727428AbfKKTvg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Nov 2019 14:51:36 -0500
Received: by mail-pf1-f196.google.com with SMTP id c13so11387649pfp.5
        for <linux-mips@vger.kernel.org>; Mon, 11 Nov 2019 11:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=CddNZ82s23zfNH8RdAI7LmnuuBp5+KYyqQC6u7vveMs=;
        b=H90H+F8w0ANVCxxIqslgtYJtBtOj+kfYYWS1NkfTrztEsf59HJhXB06YLxD5a3t+Yg
         cDoF2ekKH+Ygq0g5cUF1vO0dkrCMZBV9ndYIb9AR9YZ76khRhLcFYjeQimWtaxSpcLwQ
         uKttse7rZD0sBxvj81MwwXMAfHvHVq9NgtzjJjISjXMVP4+Ws4u3hEkQzzrl84ABKflT
         cepU3d5as0OcW14fn6R4K3hFGcdeY2T/viqOnDjaLJQjUx1hAfZC7P9eKU73ySElm5GB
         nNzLpkU3t41/T6RrnaLGoDLLqIxnR0C9Yr3An37zUDbdlzFVWKHq9gWI5pd/ijR0ZNQv
         Aqew==
X-Gm-Message-State: APjAAAWEpz4doJaYBkmIS4sCQWocBDKCbMPS/UlXXMBdtm4AwhGC0ain
        EQp98xEc0k2FX9tDLdBM3hFd/G0EdsZ50A==
X-Google-Smtp-Source: APXvYqxZ1iB0rqzFoHDZVpsC7zZLLd/YPv9GCqWpGhzvP5Xze57vOv99pAFdvYlER/Uvmo3rPWC2eQ==
X-Received: by 2002:a62:53:: with SMTP id 80mr33120758pfa.192.1573501894711;
        Mon, 11 Nov 2019 11:51:34 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id f19sm10993123pfk.109.2019.11.11.11.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 11:51:33 -0800 (PST)
Message-ID: <5dc9bbc5.1c69fb81.ce9fe.f737@mx.google.com>
Date:   Mon, 11 Nov 2019 11:51:33 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Huacai Chen <chenhc@lemote.com>
CC:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
CC:     Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH V2 1/2] MIPS: Loongson: Rename LOONGSON1 to LOONGSON32
References:  <1572847881-21712-1-git-send-email-chenhc@lemote.com>
In-Reply-To:  <1572847881-21712-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Huacai Chen wrote:
> Now old Loongson-2E/2F use LOONGSON2EF and will be removed in future,
> newer Loongson-2/3 use LOONGSON64. So rename LOONGSON1 to LOONGSON32
> will make the naming style more unified.

Series applied to mips-next.

> MIPS: Loongson: Rename LOONGSON1 to LOONGSON32
>   commit b2afb64cccd2
>   https://git.kernel.org/mips/c/b2afb64cccd2
>   
>   Signed-off-by: Huacai Chen <chenhc@lemote.com>
>   [paulburton@kernel.org: Fix checkpatch whitespace warning in irqflags.h]
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: Loongson: Unify LOONGSON3/LOONGSON64 Kconfig usage
>   commit caed1d1b20cb
>   https://git.kernel.org/mips/c/caed1d1b20cb
>   
>   Signed-off-by: Huacai Chen <chenhc@lemote.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
