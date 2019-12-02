Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04A0310F0FF
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2019 20:48:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbfLBTsZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Dec 2019 14:48:25 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44055 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbfLBTsY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Dec 2019 14:48:24 -0500
Received: by mail-pl1-f196.google.com with SMTP id az9so371658plb.11;
        Mon, 02 Dec 2019 11:48:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=bX9CisOgsw7OnLelAI5pfbcN/uqTv/aGz5gelxEy5ek=;
        b=kcZBVtaXliovaFqT141vo1K/FlyOkRKjo41eEovKKe3c56jADqb6D0cHY76+kI1W2d
         bXQwyzQWyvrrrt8KecCkugqEnG/80GH09TdiYpguEjMZnKwPNgklHe1fb+7qr19zmpkm
         ajLicWQLPKZzmz7SGfLPT+FBPlmxELxqPhse7NAmnmiPMec3hF3nInoDlHRbXx+hSFiu
         Aurwz6C7kUxwKB5dveHlEDP+FZ2zi7/jccodtx4yk2oEV8g4cB+/I57zrfgt1h8RPdoT
         Ifdd37NfhRgZhRkf2baVccMH4DwFZnpwui5a88v/YT28t3f3h289lE//pJ/HbZykZb8U
         Hlfg==
X-Gm-Message-State: APjAAAUJMXpUf7xs9c9kXeQxay3dgwsSNtsWtETUxfEnyu6a/hRkJSRp
        7c+DzhenyfrEH5f1GxaozwY=
X-Google-Smtp-Source: APXvYqwQz8AjU6WW0gbS7DlzymOC8kOmzjSpSi5j25tgOdCn57EcTguts9rzRAAQ2+lruYONEhDhYw==
X-Received: by 2002:a17:90b:3011:: with SMTP id hg17mr897761pjb.90.1575316103807;
        Mon, 02 Dec 2019 11:48:23 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id p24sm292783pff.69.2019.12.02.11.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:48:23 -0800 (PST)
Message-ID: <5de56a87.1c69fb81.8847a.10ab@mx.google.com>
Date:   Mon, 02 Dec 2019 11:48:22 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Joe Perches <joe@perches.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
CC:     linux-mips@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: Kconfig: Use correct form for 'depends on'
References:  <9fcf53ca7372ef421e3b0836e4a7ec8239b380ec.camel@perches.com>
In-Reply-To:  <9fcf53ca7372ef421e3b0836e4a7ec8239b380ec.camel@perches.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Joe Perches wrote:
> Remove the CONFIG_ prefix from "depends on" as it makes the selection
> not possible.

Applied to mips-fixes.

> commit a7effde99b6e
> https://git.kernel.org/mips/c/a7effde99b6e
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
