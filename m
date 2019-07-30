Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 755737B1C9
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 20:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbfG3SUd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 14:20:33 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38541 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbfG3SQH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jul 2019 14:16:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id f5so21657138pgu.5
        for <linux-mips@vger.kernel.org>; Tue, 30 Jul 2019 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AnIbmF0DkTbEo16MtEelTJ0IlXSRPL3zBEaTrVKwVpc=;
        b=Bc/+oZMvGC17mgUvCSzMoq7W1yBPnUA9duyYAZIEfa/5CpTcVk4zUfykTeRg56aUen
         KaZxGdoJtCJJ+sxGX+krfVhcc9oYp/pTwn3Wq4kIIO4C4ySXwBrN6XMM8mlxislT+xFk
         wsxrriBgOG0NE0wIsMPu54IBmBiCL9wmvRxXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AnIbmF0DkTbEo16MtEelTJ0IlXSRPL3zBEaTrVKwVpc=;
        b=c5e4kF5Gtc9vZ22VHlybyOIArkxQJJKoXJvflAwVfi60pAGCoI46hwBj5YdNxrGsuE
         ALR4U030kOM0ySk6YqnRxIoG4DT3kyWrNGjXNxX/cLuvbJR0GHzm7uPEXGo8Orxbv2G+
         26sadI1LNDVGynTza3dcEUxGC45po8r+nKUkcT16vVW5PbLbO9rk8pKMV75S4nUtObx1
         GkVEhzKXEb0MCEDyrKaOygh17WA4ZzjVbHkrmhKfItiqhE4lZ8c9vHCs08ySNGnRXDmp
         fJkTcZji05LHhTrKtYxC2Q5oKjkDD+kU4/lqY03XGxqNo5mYcxoD9GZhZtG8mslcf0+Y
         4z6g==
X-Gm-Message-State: APjAAAXkvdCHtAf8KcRHt/eFY31xpjDUUinwzrWf1ZA6iYGXs0BXl2Tt
        Kbtmjy5CFiVbItEPlEzbfuwcKw==
X-Google-Smtp-Source: APXvYqwrfkKZHf0lYgTSeGboE6lSa2KEHmp7pBUfC7k8Zgh0gfBfg7UhYbBO4fXcdBc9UP/r9DtKfQ==
X-Received: by 2002:a63:3148:: with SMTP id x69mr23475727pgx.300.1564510566154;
        Tue, 30 Jul 2019 11:16:06 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id g1sm106744083pgg.27.2019.07.30.11.16.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 11:16:05 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v6 08/57] MIPS: Remove dev_err() usage after platform_get_irq()
Date:   Tue, 30 Jul 2019 11:15:08 -0700
Message-Id: <20190730181557.90391-9-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190730181557.90391-1-swboyd@chromium.org>
References: <20190730181557.90391-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@mips.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Please apply directly to subsystem trees

 arch/mips/ralink/timer.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/ralink/timer.c b/arch/mips/ralink/timer.c
index 0ad8ff2e4f6e..652424d8ed51 100644
--- a/arch/mips/ralink/timer.c
+++ b/arch/mips/ralink/timer.c
@@ -106,10 +106,8 @@ static int rt_timer_probe(struct platform_device *pdev)
 	}
 
 	rt->irq = platform_get_irq(pdev, 0);
-	if (rt->irq < 0) {
-		dev_err(&pdev->dev, "failed to load irq\n");
+	if (rt->irq < 0)
 		return rt->irq;
-	}
 
 	rt->membase = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(rt->membase))
-- 
Sent by a computer through tubes

