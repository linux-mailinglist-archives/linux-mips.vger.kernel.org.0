Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F69ECBE8
	for <lists+linux-mips@lfdr.de>; Sat,  2 Nov 2019 00:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfKAX2G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Nov 2019 19:28:06 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32771 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfKAX2G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Nov 2019 19:28:06 -0400
Received: by mail-pg1-f193.google.com with SMTP id u23so7406522pgo.0
        for <linux-mips@vger.kernel.org>; Fri, 01 Nov 2019 16:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=8P1WvitWCuoMIfyQQwdT5HJvJDatDKb08EH2ZkVsQKI=;
        b=BAf2UZJiTFugOKQbhFu1DjeM7r7rx6uge+awo+/uV4JMhdcRu1keERrLlb6oAjP92S
         0xsIYLfrM7RS0Mqdm16RIIlsvE1pK9yBzfFJyIKDXlg2yduHuwdQrguohE2eGtOwpYvp
         VQNdbUfzRGi93zsTHYC815HetSyWrvbPhTMcuh5z7VZRwCOqRPDL+RvqlGRKUPQ6yb8w
         A/vb/HQmg+ilooiCD4tXcC0xNzmxG2VdgBLNFfCYtEyQlwRnLSx9r423YcA0ntqD9Dzb
         qjbr7iUsGuJHMXU2AVgo3jsSwD9SkWTl2maGbgH+jw/pBM18UU0Q5iMKGjurIiqL2+Ov
         Ox2g==
X-Gm-Message-State: APjAAAWs++HEUBirfB6fXLuRO1WH45g/oV74Hv8sLLSWnCsM/wTHVw6s
        oaGVYk5UHt66cEVOu4lnvZA=
X-Google-Smtp-Source: APXvYqydKVrj7U0DexC1yT2+o8AwDEFDXpIa7ma2Y0YXmBeLPE22ZvsmOaeNgIU0uRSUC0gXP/vn0w==
X-Received: by 2002:a63:af1a:: with SMTP id w26mr16523616pge.251.1572650885031;
        Fri, 01 Nov 2019 16:28:05 -0700 (PDT)
Received: from localhost ([2601:646:8a00:9810:9d6:9cca:ff8c:efe0])
        by smtp.gmail.com with ESMTPSA id z7sm9453879pfr.165.2019.11.01.16.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 16:28:04 -0700 (PDT)
Message-ID: <5dbcbf84.1c69fb81.1ff82.afb3@mx.google.com>
Date:   Fri, 01 Nov 2019 16:28:03 -0700
From:   Paul Burton <paulburton@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
CC:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 5/6] MIPS: Loongson64: Move files to the top-level directory
References:  <20191020150137.19256-2-jiaxun.yang@flygoat.com>
In-Reply-To:  <20191020150137.19256-2-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Jiaxun Yang wrote:
> Current Loongson-3 code can share among all Loongson64 processors.

Applied to mips-next.

> commit 6fbde6b492df
> https://git.kernel.org/mips/c/6fbde6b492df
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
