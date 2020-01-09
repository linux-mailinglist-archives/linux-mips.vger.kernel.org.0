Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6581313608E
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 19:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730350AbgAISww (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 13:52:52 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41061 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730273AbgAISwv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jan 2020 13:52:51 -0500
Received: by mail-pg1-f194.google.com with SMTP id x8so3625488pgk.8;
        Thu, 09 Jan 2020 10:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=hBV74Ydk6mDQDuE/3ONK0QaQ31FjZx8A18SMygQocsM=;
        b=OGfAgD+0djo97dIWnUmXMIDBh/t0JOEs/u6FkS1IW6oV4LcCp0K/NPTzYaQJ+Kg408
         Air9xZYESNuE2C1z6h8wodgs4b4fK3/cxJ5UzYQnsqOXn/4/drL53fcY7lmnBOg0tiA+
         wBDOBgMNg1e6yjUoJj9x8KIjAXmGmhlljHjVpx/b4WV+Caze37FQ6RS/EF4Ufw8OTdao
         BpS9Xn+BROzHTK27DMu5bIuCoM7/apJvUnuZbyedJKAr1gEDKvIyDILZQoUCHte7KeE3
         bUO8IUFT2F6p+m9XzSXHCLXhrHXU0FGk3BWGIYqQtjA4MNx7vBWV79y3x4UhbWbLuBUi
         9GeA==
X-Gm-Message-State: APjAAAVAwAPMUAtYrbXgnmm4U7JUdoU0TNzXQtbpZRXKv8JaywdZ92YE
        /EzThN1Crd6ewJ1KPN+dv6o=
X-Google-Smtp-Source: APXvYqzM1MC2kDmR4PiizMSnJKZKBlArFoxv+nUHDf4ftkSK3NfkN/tZ4G1n2hyNM/upXaE85qLq6w==
X-Received: by 2002:a63:d411:: with SMTP id a17mr13541550pgh.333.1578595970656;
        Thu, 09 Jan 2020 10:52:50 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id e2sm8956379pfh.84.2020.01.09.10.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 10:52:50 -0800 (PST)
Message-ID: <5e177682.1c69fb81.b79ec.61f3@mx.google.com>
Date:   Thu, 09 Jan 2020 10:52:49 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Mao Wenan <maowenan@huawei.com>
CC:     <jiaxun.yang@flygoat.com>, <ralf@linux-mips.org>,
        <paulburton@kernel.org>, <jhogan@kernel.org>,
        <gregkh@linuxfoundation.org>, <tglx@linutronix.de>,
        <maowenan@huawei.com>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH -next] MIPS: Loongson2ef: drop pointless static qualifier in  loongson_suspend_enter()
References:  <20191204010851.160284-1-maowenan@huawei.com>
In-Reply-To:  <20191204010851.160284-1-maowenan@huawei.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Mao Wenan wrote:
> There is no need to have the 'T *v' variable static
> since new value always be assigned before use it.

Applied to mips-next.

> commit 11d06df7b9f2
> https://git.kernel.org/mips/c/11d06df7b9f2
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
