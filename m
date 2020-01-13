Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 399ED1399D6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 20:11:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgAMTLI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 14:11:08 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43504 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729307AbgAMTKw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 14:10:52 -0500
Received: by mail-pg1-f193.google.com with SMTP id k197so5143601pga.10;
        Mon, 13 Jan 2020 11:10:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=yx6apWvkE7do4qCaKbCQiOQiIYnQT2mV1VkM+epSUiQ=;
        b=tShKaH5ZEx2zQfNn9EzMVEIhjPg9HM3+1cwbL1O4edUAJAAmXhginLCOX+mOvlzw+L
         giVKFRy5T2/0hHtiLCVWWdryTD0ciwaDZGtWQE5qpPsz0l1JDljJoP7MECFI9HXSfc/x
         snZjC3nLgq89Aqlf+H4ojpCbgnmgilxPYcxGbtv6AOcWvD7ZA7onzDguuD83pMjmOH2U
         AgFtygAgPWWZQnyh0sP47X6lzYl1m0ZF1y4kRxQPwNgt2ZfVtOGfxufp6WimjUBDTV6H
         pDoIHgqpJls5LF61S9KqRPaWCNA1nKG2AW4Wms/Pv6jtp+WJhP1Cmi48n9XXAO7Vdu10
         nJXw==
X-Gm-Message-State: APjAAAV8yAkkt2Pw0xgi3YZcM6QLgjWu9OqsXkz/6xEqJYZU5PtthCe3
        uaEgvM3+ap2e6rCa1qnDHlunVEqxVnv6/Q==
X-Google-Smtp-Source: APXvYqxhzgJBFTP7LtKH7tWm2L6UENW9XL2x2W3wBdOUSHpRnD8VSi03LXc+BajdOSay1mwNYNMR7w==
X-Received: by 2002:a62:1d52:: with SMTP id d79mr20975261pfd.144.1578942651214;
        Mon, 13 Jan 2020 11:10:51 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id q11sm15000623pff.111.2020.01.13.11.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 11:10:50 -0800 (PST)
Message-ID: <5e1cc0ba.1c69fb81.41d49.31bf@mx.google.com>
Date:   Mon, 13 Jan 2020 11:10:50 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
CC:     Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson: Fix potential NULL dereference in  loongson3_platform_init()
References:  <1578619842-926-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To:  <1578619842-926-1-git-send-email-yangtiezhu@loongson.cn>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Tiezhu Yang wrote:
> If kzalloc fails, it should return -ENOMEM, otherwise may trigger a NULL
> pointer dereference.

Applied to mips-next.

> commit 72d052e28d1d
> https://git.kernel.org/mips/c/72d052e28d1d
> 
> Fixes: 3adeb2566b9b ("MIPS: Loongson: Improve LEFI firmware interface")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
