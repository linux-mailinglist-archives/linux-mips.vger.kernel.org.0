Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD31B14918E
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jan 2020 00:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729260AbgAXXDs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jan 2020 18:03:48 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37292 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729182AbgAXXDr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jan 2020 18:03:47 -0500
Received: by mail-pl1-f195.google.com with SMTP id c23so1387859plz.4;
        Fri, 24 Jan 2020 15:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MGRq2AwVFd4DWNsp7d7HFpzZlRbQ0ZEgqyNAkNe3J5M=;
        b=T2dnSFG4VA2vnPZpfzkw4yn9JywADHhYTfKD4mgqoMFBYi+4OZZa2ZxvmK/eJI4xLt
         hMV157cOO0o5B2rILrrDUAbO6Uuk1GKS5UL5aAE3Ow1RLD9QfpGD8ZGSjLlkiS5abh9U
         0/CfdgAsW++0EAqWSouOVUtkOuSas5f7kqNaFUJC3iERqSLSVGkq1BaKOjftG/kwZ/CJ
         mgxCl/DYCLz0D0BXSI+2ufQZV6YqIC/9WbX/VQCkyByE+oRjQOqoOTfnruScn3ppCbV9
         Uw+NdCI5JOiIwfrdMZtoGprneOZ+B4eKeFhhpRo2dBGO8blMK+rTS76Tg0ceItsfx3KP
         Sj5A==
X-Gm-Message-State: APjAAAWNWlvy68FbZT5ULwGjGcfnlVYqPlc7UT0cy1Iztpmn+0eFZjG6
        PItmOpPFsE07G64A2lZH53Y=
X-Google-Smtp-Source: APXvYqxRiq2ERDzSNYLx4Td68ALF8xKHPHga/5pBcCGxCccQkad/3g/y+5tRl662fUbnwVu3Wc4PPw==
X-Received: by 2002:a17:90a:5206:: with SMTP id v6mr1779319pjh.136.1579907026837;
        Fri, 24 Jan 2020 15:03:46 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id v10sm7726710pgk.24.2020.01.24.15.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 15:03:46 -0800 (PST)
Date:   Fri, 24 Jan 2020 15:03:45 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     "David S . Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-ide@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ide/MIPS/docs: remove no longer used au1xxx-ide
 driver
Message-ID: <20200124230345.m3i223nazraoont3@pburton-laptop>
References: <CGME20200116122951eucas1p1d36493f2b496bb13dca4fd1a17abad49@eucas1p1.samsung.com>
 <20200116122938.20789-1-b.zolnierkie@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116122938.20789-1-b.zolnierkie@samsung.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi David & Jonathan,

On Thu, Jan 16, 2020 at 01:29:35PM +0100, Bartlomiej Zolnierkiewicz wrote:
> Since patch #2 depends on patch #1 (and it is also the best to
> apply patch #3 after driver code removal) it would be probably
> easiest to merge everything through MIPS tree (after getting
> necessary ACKs, from David for the first patch and Jonathan for
> the third one).

Does that sound good to you? If so could you ack the patches as
appropriate?

Alternatively I have no problem if you'd rather take this through the
IDE tree David, in which case for patch 2:

    Acked-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul
