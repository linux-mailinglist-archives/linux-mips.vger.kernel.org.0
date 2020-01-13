Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3224F1399D3
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 20:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgAMTK6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 14:10:58 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34135 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729347AbgAMTK5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jan 2020 14:10:57 -0500
Received: by mail-pf1-f194.google.com with SMTP id i6so5321394pfc.1;
        Mon, 13 Jan 2020 11:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=jTHJmlgWlvAPFQCB9Io3MPGggb4HLJiN3T7qmewcyc4=;
        b=g3WWCowZqfd9Cq1tSFDglxWkM3AEBIigWG0c5WkB4eFxinTwC8B5q4w63woyc8Ynhd
         u+/0D7ggtCuqzw9pxMKr9WL67FiATYDAo+RWoSz4YYP18oeE1GiybgJvzD7ipmMom1nE
         21vGMsBy4dJSbn05c4FaA+7o6btToqihJcDq3prWsMdhpDF7rcG2DIOKcNgpFgqYHs+R
         Y6jpDug+b956lRdUYXcnWk9OjrsR6yc0MwWJY+A9e9/n0TkEDRFJZI3Ptc1oA9FJNoqS
         bFDDPpHIKjYlpRYaHVg4rbbPDcRQPW4DnvmZ7tYynjSyRTr/QD7vnDVPcSdCKom8C3Eo
         q1ow==
X-Gm-Message-State: APjAAAXFvAzcppmRxm3ByPTGic/FOGJQovMg57ATdrVtx+1+DVUWj6PG
        CbvDBtwz5T2L/fk/pl1nTa8=
X-Google-Smtp-Source: APXvYqyz3nXvBn+dYOeugnrUILRd9W3o5j47cX3X77TgWPnRTx2NKlIix87cMbioUxbaly8p+7BtMQ==
X-Received: by 2002:a63:4b50:: with SMTP id k16mr22588647pgl.386.1578942656431;
        Mon, 13 Jan 2020 11:10:56 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id x197sm15590626pfc.1.2020.01.13.11.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 11:10:55 -0800 (PST)
Message-ID: <5e1cc0bf.1c69fb81.65bf6.48ee@mx.google.com>
Date:   Mon, 13 Jan 2020 11:10:55 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Ralf Baechle <ralf@linux-mips.org>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] tc: Make tc_match_device() static
References:  <20200112165229.20567-1-geert@linux-m68k.org>
In-Reply-To:  <20200112165229.20567-1-geert@linux-m68k.org>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Geert Uytterhoeven wrote:
> Unlike its PCI counterpart, tc_match_device() was never used outside
> the TURBOchannel bus code.

Applied to mips-next.

> commit 3d9f44ef7553
> https://git.kernel.org/mips/c/3d9f44ef7553
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
