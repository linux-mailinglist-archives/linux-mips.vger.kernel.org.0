Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7A2ECBE9
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2019 00:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfKAX2I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Nov 2019 19:28:08 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43379 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKAX2I (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Nov 2019 19:28:08 -0400
Received: by mail-pf1-f196.google.com with SMTP id 3so8025722pfb.10
        for <linux-mips@vger.kernel.org>; Fri, 01 Nov 2019 16:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=/hkV9yhsgqR6rPI5mttxkbMzorG5OsCV+JJz5ILqkpU=;
        b=sjjMKHNUMOcsd3Ox7FZq/1qt/wJUeh6utsh8gI+z/DN657DrQZ5ZISjXnx9P2W8mxs
         HUqbzzezbKSEfq51Nqo/wtY7nwO3f3HP6xGvily5KPP//FxRqvVX8hYeFptw+R2icr7g
         da+DnmoCjW6idH+8BEJylJayHj1UzwCetucG8QWEGBbwFWBbRtBRZJLRc3YVoF9vzzr8
         rYuvzBGOceeRCGNsZxSaRuHrCFqd4PwiQmhVQ43TjkmHuAyg2Polr93AmQYKe1u9CI7v
         u4+TZTrsljzlnrxNIhDTy46QhUbBH/dV4JyNYICbAr978/yd3mjiVmJn2dUPxi4ffQS+
         6D3w==
X-Gm-Message-State: APjAAAXEMmKpFaB8Qua2pXd2qnG2rkdkGQFTvKQwNe5Z8m2nDSKTUQ7K
        fMfPS6U9FUIM700TsUAmlMCLTvgqwOiwFQ==
X-Google-Smtp-Source: APXvYqzJF/AMmxNoPMyoZLP9jnFtJxkX4c3kPE/fbioiGxWAYWpTLz2MQa+etwIm/h76FpbtoUV9xA==
X-Received: by 2002:a17:90a:9a9:: with SMTP id 38mr19015987pjo.45.1572650887841;
        Fri, 01 Nov 2019 16:28:07 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:9d6:9cca:ff8c:efe0])
        by smtp.gmail.com with ESMTPSA id w27sm7818394pgc.20.2019.11.01.16.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 16:28:07 -0700 (PDT)
Message-ID: <5dbcbf87.1c69fb81.695e7.6eaf@mx.google.com>
Date:   Fri, 01 Nov 2019 16:28:06 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
CC:     linux-mips@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips/cavium-octeon: Fix typo *must* in comment
References:  <3a1eda2f-bc4b-0958-d609-6376663faa9a@molgen.mpg.de>
In-Reply-To:  <3a1eda2f-bc4b-0958-d609-6376663faa9a@molgen.mpg.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Paul Menzel wrote:
> Date: Mon, 2 Sep 2019 11:55:06 +0200

Applied to mips-next.

> commit 474435a05830
> https://git.kernel.org/mips/c/474435a05830
> 
> Fixes: 5b3b16880f ("MIPS: Add Cavium OCTEON processor support files to arch/mips/cavium-octeon.")
> Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
