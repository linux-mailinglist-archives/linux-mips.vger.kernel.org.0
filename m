Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F9B137752
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2020 20:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbgAJTgM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jan 2020 14:36:12 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36710 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbgAJTgL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jan 2020 14:36:11 -0500
Received: by mail-pf1-f194.google.com with SMTP id x184so1611095pfb.3;
        Fri, 10 Jan 2020 11:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=fp7F0h/ASNuuSOx0sNaPmrqw5GOZkkxwfSNU2DVyelU=;
        b=lH9d3dNVTcEzepTDksDFohUecJOqTJ+dAPRcjfLnd3Ks9JsgWgec9eEhBrFV5Ob8pE
         uAeGg9+ETVnzYd4N3qcJPA1FwSWw3Xu6CdilgOxJ4IbN7yXbKG03ZFqqPofewja6kUUD
         IP56vlyBI4taDS0CGwA4aEDo7Gl+k7vmocY/0AN+oMQYacfMsGgDb9IfLQvQD8rY2CKX
         FPJ6QEYXyJ1MC0JwTt+ybl545RWOySLA5Sasl5b2FdUFaTNjfme6cFDBy1GiFPx5lam/
         ZPVtvABgvPkS4a/1TosTg+y+o4PaeOGox+RBxqdov9pmQOSQBsx4/pxHpMFR6661f73K
         VMkw==
X-Gm-Message-State: APjAAAXnK1qlHUJZ9hnlQab65v5G0CrJQmjc2iC984/PW6jir98osmWt
        VebFn0T+F3DZ2YYDzzuOp+A=
X-Google-Smtp-Source: APXvYqyOQcN8i5IgYFLjmxs8T+WPRk7+OuLSlMn4JVw9bePGg+UhOPmw86HvgutY4z/91MDlxz/gUw==
X-Received: by 2002:a63:ec0a:: with SMTP id j10mr6340399pgh.178.1578684970862;
        Fri, 10 Jan 2020 11:36:10 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id e16sm3646028pgk.77.2020.01.10.11.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 11:36:10 -0800 (PST)
Message-ID: <5e18d22a.1c69fb81.2a2d9.8625@mx.google.com>
Date:   Fri, 10 Jan 2020 11:36:09 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Kees Cook <keescook@chromium.org>
CC:     Paul Burton <paulburton@kernel.org>
CC:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: BPF: Use sizeof_field() instead of FIELD_SIZEOF()
References:  <201912180915.9878694B@keescook>
In-Reply-To:  <201912180915.9878694B@keescook>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Kees Cook wrote:
> The FIELD_SIZEOF() macro was redundant, and is being removed from the
> kernel. Since commit c593642c8be0 ("treewide: Use sizeof_field() macro")
> this is one of the last users of the old macro, so replace it.

Applied to mips-next.

> commit cc43928ba401
> https://git.kernel.org/mips/c/cc43928ba401
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
