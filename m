Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13FD2E29BA
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2019 07:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437399AbfJXFCd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Oct 2019 01:02:33 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39876 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbfJXFCd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Oct 2019 01:02:33 -0400
Received: by mail-pf1-f195.google.com with SMTP id v4so14335317pff.6;
        Wed, 23 Oct 2019 22:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:subject:references
         :in-reply-to;
        bh=T+cg4jC/pyv+WL1IMPRAYUsbPvnCELFFTJ6x7ILWLzI=;
        b=oTE05/sd7/Z7sgjIKB3hhfm4lLvuFWxkQZ9mp3UGU9ukNQZQ3TPJiLgHyNsV112IgT
         Y6LicM5WAy0YzJYLPJJbFAxU5UfTaLzF7Mz5tn13TslW75MxFTyXuvV8382d0Ysb04Yf
         sk7MP4scmrGFdJGUO0lmqpRL2Rs2pyFMK92nFxILbpEPPwfQSelctFdnMEtqjQqyqvjY
         0dInw5E4OHqwpvN+iaihfzmFfgnf8ylwbc0VCz0eRaP4XvO/WieFXkoD2AdhE8sWbiyU
         z0OvNWJmhI+S8l0NJ5LRjWdmBsqwWW2fwPWOLxEFgTaaQr0fHeYMOMilP9RKnQoNPE/D
         TfFA==
X-Gm-Message-State: APjAAAXJH3P9fWShvqses/OW4Ks3sv85PJugCuRIvOCxPC6cP1oXUCYy
        bPODgUy7lbzdhHUuwPJUYlk=
X-Google-Smtp-Source: APXvYqzlL08Rlx0pL4sDZ2s0vYurBk3w4NhJKVXUUWgU4/OhoZS2HFVVVD+aGkSpD+7Fc5y5Y+OtzQ==
X-Received: by 2002:a65:6811:: with SMTP id l17mr14138612pgt.434.1571893352275;
        Wed, 23 Oct 2019 22:02:32 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:5cfa:8da3:1021:be72])
        by smtp.gmail.com with ESMTPSA id 13sm25545646pgm.76.2019.10.23.22.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 22:02:31 -0700 (PDT)
Message-ID: <5db13067.1c69fb81.a07a6.2167@mx.google.com>
Date:   Wed, 23 Oct 2019 22:02:31 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/5] MIPS: SGI-IP27: collect externs in new header file
References:  <20191022161315.4194-1-tbogendoerfer@suse.de>
In-Reply-To:  <20191022161315.4194-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> IP27 code has a few externs distributed over .c files. Collect them
> together into one commcon header file.

Series applied to mips-next.

> MIPS: SGI-IP27: collect externs in new header file
>   commit 249be5633cdb
>   https://git.kernel.org/mips/c/249be5633cdb
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: move registering of smp ops into IP27 specific code
>   commit c823f4160978
>   https://git.kernel.org/mips/c/c823f4160978
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: arc: remove unused stuff
>   commit cbd09241dd9d
>   https://git.kernel.org/mips/c/cbd09241dd9d
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: arc: use function argument for passing argc/argv to prom_init_cmdline
>   commit 7b16831d1eb1
>   https://git.kernel.org/mips/c/7b16831d1eb1
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: SGI-IP27: reduce ARC usage to a minimum
>   commit e942242784d0
>   https://git.kernel.org/mips/c/e942242784d0
>   
>   Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
