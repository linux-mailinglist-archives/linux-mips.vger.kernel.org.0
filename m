Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C4C4F5C5
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2019 14:42:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbfFVMma (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Jun 2019 08:42:30 -0400
Received: from mail-yb1-f182.google.com ([209.85.219.182]:46521 "EHLO
        mail-yb1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfFVMma (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 22 Jun 2019 08:42:30 -0400
Received: by mail-yb1-f182.google.com with SMTP id p8so3802868ybo.13
        for <linux-mips@vger.kernel.org>; Sat, 22 Jun 2019 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=pyrDOB8fiGSo/LcIAiccCbta0QZV69fKk4ZnmtwAP0E=;
        b=lOWSHSr4Bz4an/cGwgkOO+sh46xFyZUlAc4SSoUC7FovOAiKsQKAmLbEe7LA+OtuqY
         ctyk8PQue77WP7aVnG/V4jImqjg+c6+XliAyLzzCz2gD4r67bCrHYmZ1VDFrV+bhxYvT
         S+qFCu1ge26oVag83WCEb/A8RTJ2U+D9E8GsDd3EFgRAZ4Jw7tfJrOqG6jbksHBdWWGv
         LJizbtF272q76cBM4kp6dZ8VKjKOyLrwMszTFIhp+EBStKYGuNupfDYxHwVERAOGWvs2
         PcHMMvthNOlbbERNjEwjY6jOe9Qm70MVKKs18Rj/oeGtjN3JSCjyxZnMmNR8NUlQoIv5
         a1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=pyrDOB8fiGSo/LcIAiccCbta0QZV69fKk4ZnmtwAP0E=;
        b=Eh+FUHcZu0rZAmxUU1ertZ/fnc+SLzzvORWksPiscP2c0iz9NCvwwRGqj50ziItvzB
         X7wT7vJAudVN3CufQts2KrrU79hc30FxMyV40IsCFMnyee7jK1ZiPJCUyRfbLT9g0IVM
         /FNA2hKRdU4JmPwEADFyMYeYTILDnyS2bdOtar118Wwcla2YVquFjTLQjXIIOSKURRqm
         HD1wVX+PLfLhuj3TzyUNAR8naq7kQeLX8oBd2OtOp0wGgpSXwM0IyAtZ7oynHEntLN5w
         PvSk/c8wFD4F7mEk1ZczaaHYjBmjs6Jjlqz0257C+i9Mbi5n0TcT+usb9ML1R6JR2stV
         2Okg==
X-Gm-Message-State: APjAAAUDWV7YTQPtt5Gv/A7Ix4L9dmvYtgBCjwYrN6LwzpM3/19x7Nh1
        jImJNw4/HLvDt/gE45RLjIFHzPsjgNAHqn+ndy1uSw==
X-Google-Smtp-Source: APXvYqxLuvTZDEgQ6P6hlUXEdDVy8n+sY6J3u1BJnCv03D6NgHXIjHd+hLnxE5ofNIic1kATwjIuxtUR8D/oc+gvgAQ=
X-Received: by 2002:a25:b7d2:: with SMTP id u18mr28323512ybj.34.1561207349194;
 Sat, 22 Jun 2019 05:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
In-Reply-To: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Sat, 22 Jun 2019 14:42:05 +0200
Message-ID: <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
Subject: SGI-IP30
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

hi guys
I am new on this mailing list, is there anyone on SGI-IP30?
I am with kernel 4.18, there are a few quirks ... with the SMP

=)
