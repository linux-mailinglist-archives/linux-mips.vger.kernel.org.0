Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA4913774D
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2020 20:36:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728369AbgAJTgJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jan 2020 14:36:09 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39286 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbgAJTgJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jan 2020 14:36:09 -0500
Received: by mail-pf1-f196.google.com with SMTP id q10so1596825pfs.6;
        Fri, 10 Jan 2020 11:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=Ubz1pY/rEGbBUXDLqdjiVBBYYj5VCsEXF78ESs6AqOE=;
        b=Cd+eptk/5ytFyFd9qQefKPJFdBwhFPbc0OQ6BtItgkQDgKgX1ccw4gOMKM3/3/AN4G
         Jg7aEIjUUoaCycAqHZHEOznrReCKcnv8Y0Iq/5QK4JYRcHBPB9RpnieZmaW55Dbf4Wje
         q8eWvcihYfa2s380XnlinvbiaVCw7Mhp25lY3aK9aTpV6JJNNtvqphLXpXHlHkXffLVc
         VujdVjaaj2xW4JDWdDKZXKFu9EJoS5I+yjQl7JbZKP44/uEEx4nTAJvh/sfzuRfYHOdq
         GpXb9wB4Yp8Yc1/NIbTWnQ2aXKA2VRVw3Lo9QJU0kraqndGsLvgwOt1yAHmsJKib/iqP
         k8Yg==
X-Gm-Message-State: APjAAAU0SFa7d7hT6Djq0XSn0srjEcg/zPvRWq6/epGYajJhki4m07MC
        BwNy9gr69dMp7KjvVxG9HFE=
X-Google-Smtp-Source: APXvYqzUEK5E5gQm6s08F5JZgLDlunfuz/bHMRDVSrxXDeQ79nBQWHA3qHAc11JsvEo2Ste9lYxd+w==
X-Received: by 2002:a62:e912:: with SMTP id j18mr6008649pfh.4.1578684968302;
        Fri, 10 Jan 2020 11:36:08 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id y203sm4145509pfb.65.2020.01.10.11.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 11:36:07 -0800 (PST)
Message-ID: <5e18d227.1c69fb81.44066.9d0d@mx.google.com>
Date:   Fri, 10 Jan 2020 11:36:06 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Julia Lawall <Julia.Lawall@inria.fr>
CC:     Ralf Baechle <ralf@linux-mips.org>
CC:     kernel-janitors@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 08/10] MIPS: use resource_size
References:  <1577900990-8588-9-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To:  <1577900990-8588-9-git-send-email-Julia.Lawall@inria.fr>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Julia Lawall wrote:
> Use resource_size rather than a verbose computation on
> the end and start fields.
> 
> The semantic patch that makes these changes is as follows:
> (http://coccinelle.lip6.fr/)
> 
> <smpl>
> @@ struct resource ptr; @@
> - (ptr.end - ptr.start + 1)
> + resource_size(&ptr)
> </smpl>

Applied to mips-next.

> commit ecb983790fe8
> https://git.kernel.org/mips/c/ecb983790fe8
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
