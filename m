Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56530597D5
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2019 11:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfF1JrW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Jun 2019 05:47:22 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:47001 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfF1JrV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Jun 2019 05:47:21 -0400
Received: by mail-yw1-f68.google.com with SMTP id z197so3204846ywd.13
        for <linux-mips@vger.kernel.org>; Fri, 28 Jun 2019 02:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dW5N2IvW44ysh7pKUv7Y3Ok2zXpm2irkmGW5SzKa6aw=;
        b=i4y1kRE6MCgJFZcnFRkHSaqXUYDIRevE40tmbqvv0BFVdDp782uKbcJqIIGLK89Eao
         WkUOrCOdiygCsO9WfC4WTUzcnwdQng44M4r2GCoMSNiyWS624sWB1sAeh2CbZpjiXEbQ
         QDoLcIvcD0gwuBDtA6HER+3XshTzGDqXGhsYxiXZBdVOMaoPbkVjlnHigg1xxsGe5jrh
         t5HKiXApRkZZqf0dcPd42CmU3eglX8xRen8KW+Ki4sZN+4WRLA4GT6DLrINEA4ZZ2J55
         g0ZwvzNzqKV7FzaMIZIdH/UuV9sxRJrvRIZjykm3DmG9wpwRgKyYRWbsmNgAm/meDjWI
         abLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dW5N2IvW44ysh7pKUv7Y3Ok2zXpm2irkmGW5SzKa6aw=;
        b=V+HRExXeayP1aEH0o9y4w6DShixpDyQTIQVAmFBPpyhrVyLaaQQL/0EQ0ylsVWUgS1
         /Uv0PUm3mc9ol1SQWiFktO1IJ3nVC3zgoAFePpWKLbr/1TZljB7Bvu+1geqt8W+5fbQK
         8cbUDZ3oor0Wct6ORIXIJ6grrLQMMQ4IUlCci0RGS2vqDcZ22MoOgXw94/apLPO7Se5u
         iIsyWbGidZwDQ9IkbJW08PjfA0LvsB8i+TSKT0pbbjxgD2VDQ/Vj/5FFesYpaXYOF/KM
         MivaS6H+PL/KN+5hdTD2igLOLTKjycVrF6pKmvyUXnVIMGUZ62vMzXjaxDPwL92CRDz2
         QAfQ==
X-Gm-Message-State: APjAAAUoKBd9yM8tjbXoOOS0ojieH5ymMUkxxTtldG1jQBlcjCNNtcm2
        /KixcWl6MxbOSquUVHVO3HzcRIqHpD7D2b9sM0twgnMi
X-Google-Smtp-Source: APXvYqyrd/cUM9OKi7eZkpXjXSTGzn2RsAc0i/b9aREVMHG+waXdxFgOvnDrD1v6XJk+yUW7FUMQfh9MPL1xntWW3Dk=
X-Received: by 2002:a81:8311:: with SMTP id t17mr5120357ywf.166.1561715241223;
 Fri, 28 Jun 2019 02:47:21 -0700 (PDT)
MIME-Version: 1.0
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
 <20190624175553.2tpepq5zsamovrra@pburton-laptop> <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
 <CAEdQ38F6gG1Ee5h6PXZ-wuxuOxAycaWBD_+hTNRjtfQHNw696g@mail.gmail.com>
In-Reply-To: <CAEdQ38F6gG1Ee5h6PXZ-wuxuOxAycaWBD_+hTNRjtfQHNw696g@mail.gmail.com>
From:   Carlo Pisani <carlojpisani@gmail.com>
Date:   Fri, 28 Jun 2019 11:46:58 +0200
Message-ID: <CA+QBN9AGd9YF3V+jO1asXgRnTVWC90usj8mtDb5TnWJnh-UaXA@mail.gmail.com>
Subject: Re: SGI-IP30
To:     Matt Turner <mattst88@gmail.com>
Cc:     Joshua Kinard <kumba@gentoo.org>,
        Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> Rene Rebe (cc'd)

I have just talked with him about his patches: he said that he mostly
fixed some PCI bridge endianness and did some progress with the Impact
cursor and video mode reverse engineering.

https://t2sde.org/packages/linux-ip30

Good, very very interesting!
