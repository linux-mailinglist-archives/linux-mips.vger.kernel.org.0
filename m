Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C99DDD29F
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2019 00:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391804AbfJRWNF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Oct 2019 18:13:05 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46123 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389659AbfJRWNE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 18 Oct 2019 18:13:04 -0400
Received: by mail-pl1-f193.google.com with SMTP id q24so3479100plr.13;
        Fri, 18 Oct 2019 15:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=LJ5OwWm1TmDzcWAMMg8LWHy3PtCXgtD6rnGsJm0sXXw=;
        b=CpLeFHyEjaE7ES6d4HT8r7+ESJEWPOvf5ZGXDULpxG4TgaUAzaY6rnQxkYLOiPDDxZ
         YVT7jG/f/wC33/CBUOroj/L8MWc2fIBtYj5Yif6v98AfLZ54sU17+wMrIBmBZ2qYzxbn
         ImCPrRlr+Cue5n3m0KfnPJILwWJ6a819/YJUtcEfzqHDRhqN4BNo0ZOY8+hT+vvG+Fir
         x5olysVbIRCbHNOAiCDbv8BvB5cSY6CB4TQN+ssrDFDiRHy4hF7aCC4aHgpBgW5PE7/u
         sSE9LBdT/jZ+Rb8bCSrLj8UdZZT1HesIPvyKuE5vQiYNoGhWZfc9piLJL1E254GNNjlD
         0nug==
X-Gm-Message-State: APjAAAUAu1VrXljeROTF1dkuY5I8r7MOUcn6JHMtd/hNjM23F5BmvfAU
        RatIBKvKdPscGShDat76wb8=
X-Google-Smtp-Source: APXvYqyMYL+IS5XLskh7EtVaMTmbT57MDPd/VtnWQN1epa433p94XWh2FET+yxSTCX55G8Vkn6FPTQ==
X-Received: by 2002:a17:902:aa41:: with SMTP id c1mr6795640plr.153.1571436783122;
        Fri, 18 Oct 2019 15:13:03 -0700 (PDT)
Received: from localhost ([172.58.38.188])
        by smtp.gmail.com with ESMTPSA id e16sm6876437pgt.68.2019.10.18.15.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 15:13:02 -0700 (PDT)
Message-ID: <5daa38ee.1c69fb81.fa39b.1bb9@mx.google.com>
Date:   Fri, 18 Oct 2019 15:13:00 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Paul Burton <paulburton@kernel.org>
CC:     linux-mips@vger.kernel.org
CC:     linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Use @kernel.org address for Paul Burton
References:  <20191016182316.535398-1-paulburton@kernel.org>
In-Reply-To:  <20191016182316.535398-1-paulburton@kernel.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Burton wrote:
> From: Paul Burton <paul.burton@mips.com>
> 
> Switch to using my paulburton@kernel.org email address in order to avoid
> subject mangling that's being imposed on my previous address.

Applied to mips-fixes.

> commit 0ad8f7aa9f7e
> https://git.kernel.org/mips/c/0ad8f7aa9f7e
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
