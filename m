Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3075D1600FD
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 23:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgBOW4D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 17:56:03 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:34142 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbgBOW4C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 17:56:02 -0500
Received: by mail-pg1-f195.google.com with SMTP id j4so7057327pgi.1;
        Sat, 15 Feb 2020 14:56:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=4P+HZFnryW1ceNCZu3gsGIqLfCyZejArwm8tNC7DVtI=;
        b=KOU8QSC5/IgZBgU3hw7iWSCy2BMRQRa322xhpjk3xFhBdzxwwdHfaZ9BWqqt3ThEt7
         lTW+9nZcnizorgt9yuv59sK0OM/EA59B4t3FCFF5y5P+brHyuemXgXBZlERprBwj9E6A
         wDBbux+HorF38/jEfgBR+0pnXs8id5boalLsjD4gTYOY+ENzmc+EZEaItAyZTs90SlRj
         cQgBwCuOUt45yCXQxhb0T5KzmJNccWuDowIp8UVxH9UqVEzQm8D4SQbndXP+pmfcoIPe
         spGq4gqIsNwXTQjRd6+e2gQTbPfE2sMMKB9FdcjmFpjmco1GqJvaHtas4/8p5g2sh+sg
         9cUQ==
X-Gm-Message-State: APjAAAUXpvZOxp+ov+iSKW2is8WLy2X+QAs6ttgK/hLgGGDNNyq5gdtA
        8ajIdAelVoIz299Ayt4l9f1A5mgTsEomoQ==
X-Google-Smtp-Source: APXvYqzZjNqkLYoW+J833Ezg6lYMbZGMNlRQrTNw3aiF7PIoiKNVxFFQH7ukzembxR30AwmB334ukw==
X-Received: by 2002:a65:68ce:: with SMTP id k14mr10111977pgt.336.1581807361654;
        Sat, 15 Feb 2020 14:56:01 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id a10sm4762684pgk.71.2020.02.15.14.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 14:56:01 -0800 (PST)
Message-ID: <5e487701.1c69fb81.107e8.b7f9@mx.google.com>
Date:   Sat, 15 Feb 2020 14:56:00 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC:     ralf@linux-mips.org, paulburton@kernel.org
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: VPE: Fix a double free and a memory leak in  'release_vpe()'
References:  <20200202201922.22852-1-christophe.jaillet@wanadoo.fr>
In-Reply-To:  <20200202201922.22852-1-christophe.jaillet@wanadoo.fr>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Christophe JAILLET wrote:
> Pointer on the memory allocated by 'alloc_progmem()' is stored in
> 'v->load_addr'. So this is this memory that should be freed by
> 'release_progmem()'.
> 
> 'release_progmem()' is only a call to 'kfree()'.
> 
> With the current code, there is both a double free and a memory leak.
> Fix it by passing the correct pointer to 'release_progmem()'.

Applied to mips-fixes.

> commit bef8e2dfceed
> https://git.kernel.org/mips/c/bef8e2dfceed
> 
> Fixes: e01402b115ccc ("More AP / SP bits for the 34K, the Malta bits and things. Still wants")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
