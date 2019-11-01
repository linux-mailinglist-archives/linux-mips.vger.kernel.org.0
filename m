Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E25ECBEA
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2019 00:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbfKAX2M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Nov 2019 19:28:12 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45360 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKAX2L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Nov 2019 19:28:11 -0400
Received: by mail-pf1-f194.google.com with SMTP id z4so2001866pfn.12;
        Fri, 01 Nov 2019 16:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:subject:references
         :in-reply-to;
        bh=NP3ZrxcO1QpIKzwOZsROhhHcvICXJb13Z/S4bkxqVvk=;
        b=VjBURhKMN9ZubjkLhS17ipo+kiaI49+qjMRLSgGY78uxzgjXvG1d8nG9qdUs9yT935
         p1SC62/gRnXtMcB8G1ZuY9C+r7c5057KTn/lqJ/WKpWIIs7D8KEeWULKXk70ahVRUWGp
         xLSL9PE2jcU07GpZUs7fEJLAOXOxnuHbglrIFNDPxkid2oAhoDhMCjGIwyPDkmxFqrQZ
         ovKkdBxWG2Kz/viAJPSXm6tiKg9jq0yj+dJyEbRMcPNCwnEafBge+yMzq8EM1ERvEu7x
         UZ1mCP9n1lhgnfdVLma4HWQaVXzOjC5ObVlUY2XK7UefzEbRkjz8f1TfrPDedSKhm21z
         mg4Q==
X-Gm-Message-State: APjAAAXficK03OOhzyfhnCaR+Lsrj+v5esUpMF2qXw9naiuJwLayI3wG
        TMSVH/T6H8L8Ol6V6+ySQI8=
X-Google-Smtp-Source: APXvYqzLgFXm1XDbHLFZUnRMMWPVE2HFoQzhnBSpv5Ds43AV+WBW3JEVOyIQIhFzbXgqI/L3jnXFcw==
X-Received: by 2002:a63:311:: with SMTP id 17mr15896137pgd.327.1572650890852;
        Fri, 01 Nov 2019 16:28:10 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:9d6:9cca:ff8c:efe0])
        by smtp.gmail.com with ESMTPSA id f25sm11426079pfk.10.2019.11.01.16.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 16:28:10 -0700 (PDT)
Message-ID: <5dbcbf8a.1c69fb81.57661.f47c@mx.google.com>
Date:   Fri, 01 Nov 2019 16:28:09 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: SGI-IP27: replace MAX_COMPACT_NODE with MAX_NUMNODES
References:  <20191030105144.10686-1-tbogendoerfer@suse.de>
In-Reply-To:  <20191030105144.10686-1-tbogendoerfer@suse.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Thomas Bogendoerfer wrote:
> MAX_COMPACT_NODE is a leftover from the compact node implementation,
> which is removed now.  Use MAX_NUMNODES instead.

Applied to mips-next.

> commit c80b48965a3f
> https://git.kernel.org/mips/c/c80b48965a3f
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
