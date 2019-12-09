Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BD7D1174D9
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2019 19:48:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfLISsp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 9 Dec 2019 13:48:45 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38362 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfLISsp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 9 Dec 2019 13:48:45 -0500
Received: by mail-pl1-f194.google.com with SMTP id o8so6165305pls.5
        for <linux-mips@vger.kernel.org>; Mon, 09 Dec 2019 10:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=WKjY8JOchYwaR/ogp8HErQsNIjZfueYImfok/b9T/vg=;
        b=c6cvvI4YwwMF1r69u4zPgMP9UuHpLAzZdKYyr3eigXtF7DT/aiYO+fCZWoQYHGkVZn
         s7PSDtCDvlhNZ7he6M/VWbNLNUtSFLHSSuN7AGgirpOEeA56HdJyXtkYoXgtYwcBXQEL
         eCIz1v9BnfwPg6DUN7kF6AwiwmtNHUnuv5zZ8tK0xmbMcZWoawICe20aVTlcDx+FKJSS
         shHa7nxRqT7zFnwIPrjo2Yf2oFzeixnZbS/wzlWwO5g1oe/IEH1oGUZD7CRN8hqOammJ
         YfecwZSU2r2dcviXvggiHR5SELBwS0Lh54vaM4jGk0oUNF5c2hxyDB4L4KBOQRciaRPu
         xA4Q==
X-Gm-Message-State: APjAAAXhA1t7noVswauiSYXrasivpITMhT1shagFXF4529MZrSSAVwJa
        qpUfxvLA89QUuKZL6W3SweuWW9wNHvS9+w==
X-Google-Smtp-Source: APXvYqzbjgtOJoDYNVK/eRAXCnBeTei0iLuO+qxhPmfF3GmQTBQYA8Y38/grUNppNE/iIQDw8kJGBw==
X-Received: by 2002:a17:90a:9908:: with SMTP id b8mr517368pjp.89.1575917324778;
        Mon, 09 Dec 2019 10:48:44 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id e25sm273666pge.64.2019.12.09.10.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 10:48:44 -0800 (PST)
Message-ID: <5dee970c.1c69fb81.7784c.0f26@mx.google.com>
Date:   Mon, 09 Dec 2019 10:48:43 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     jouni.hogander@unikie.com
CC:     linux-mips@vger.kernel.org
CC:     Jouni Hogander <jouni.hogander@unikie.com>,
        Paul Burton <paulburton@kernel.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Prevent link failure with kcov instrumentation
References:  <20191209123707.19693-1-jouni.hogander@unikie.com>
In-Reply-To:  <20191209123707.19693-1-jouni.hogander@unikie.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

jouni.hogander@unikie.com wrote:
> From: Jouni Hogander <jouni.hogander@unikie.com>
> 
> __sanitizer_cov_trace_pc() is not linked in and causing link
> failure if KCOV_INSTRUMENT is enabled. Fix this by disabling
> instrumentation for compressed image.
> 
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to mips-fixes.

> commit 3f0a2abff9aa
> https://git.kernel.org/mips/c/3f0a2abff9aa
> 
> Signed-off-by: Jouni Hogander <jouni.hogander@unikie.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
