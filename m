Return-Path: <linux-mips+bounces-293-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B60D07FA652
	for <lists+linux-mips@lfdr.de>; Mon, 27 Nov 2023 17:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FBC9280F02
	for <lists+linux-mips@lfdr.de>; Mon, 27 Nov 2023 16:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA15364BC;
	Mon, 27 Nov 2023 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOpiZ4Yg"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21298DE
	for <linux-mips@vger.kernel.org>; Mon, 27 Nov 2023 08:25:17 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6c48fad2f6dso532580b3a.0
        for <linux-mips@vger.kernel.org>; Mon, 27 Nov 2023 08:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701102316; x=1701707116; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W9TTKcIk+mWP67gxtJMKGszql8gYTWQBjGYcJE+4pRw=;
        b=ZOpiZ4YgK35SZmBVqaJLnRoWnKVt+yOjKOrQRLQ7sZ1aJmhwifuKeEKAqL9dYuioU5
         3fGnpPKjuds+IvXkCHMRIsrsS5nvRlBAhFaxsWAMx3vcb7S/488X24J71vSxSgbRiMLF
         sR2ZjWRWuGhOYe0AHVv1H6+oYcZ9Nbb9PO8nNKTIZj58yvOAOoHt8ghcIrIZeM8JFLe1
         9SCLAFWDIhh8TxwZB+U6qvsAKSNRU+Bxd86xo7e2IEDasg5fZzHLY3yb98iPMx9ui9jM
         okRLTJ5arfk5CPfpAf9xC/IRm1wjFdmA6GwLr1ktwDtKQi2XkTPBnIUXTXN8tVfs1peQ
         08uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701102316; x=1701707116;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9TTKcIk+mWP67gxtJMKGszql8gYTWQBjGYcJE+4pRw=;
        b=awE25QRTuGtPWtgV5m6vTmZDql8Sa+MqauO5zF6GnmEAtBXQJkfHZ6ODL2GjhDRDMj
         GijfPGoLxtp5deHvHkOQP5UpAb7P0sIdW3r/lm1Lenxl+0hcvt5QYQZZdRtnTH5WK2Ji
         0KwtKqXVD9kyhPxP42kBMTrzld4StKt/0nleveY5Ew5u/KfwS3PlU/huUVkpDPdTMu+W
         ay9Py7qq6b6J11+TDkFyV9fA14bL/zXEAiVPty7GM3Hv1zn0aGHkSS/meDtExdvgaeDy
         uoArNca/jZLaG8fOgdAI/KL/FD+xr9eHeddJnunZZZDRJgJpSLYPYw5OWYzxIcO3FynF
         1Nqg==
X-Gm-Message-State: AOJu0YzpMiNdqB+b8+yAUwu35OKUUeerfThKDotfOwFruZhT18QmNpge
	tcJIQkaAkdLe7UnNSiBrR8fDqMlWxbY=
X-Google-Smtp-Source: AGHT+IFsuEXMLv2jDlSxjNqm3fpX7WjJbEm9SbSVwYQX0xursyBKrPwyCOwTu9dqP6ejrREu40GySQ==
X-Received: by 2002:a05:6a00:194c:b0:6cb:7b09:9989 with SMTP id s12-20020a056a00194c00b006cb7b099989mr15741592pfk.3.1701102316196;
        Mon, 27 Nov 2023 08:25:16 -0800 (PST)
Received: from DESKTOP-6F6Q0LF (static-host119-30-85-97.link.net.pk. [119.30.85.97])
        by smtp.gmail.com with ESMTPSA id b12-20020aa7810c000000b00690c52267easm7320995pfi.40.2023.11.27.08.25.14
        for <linux-mips@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 27 Nov 2023 08:25:15 -0800 (PST)
Message-ID: <6564c2eb.a70a0220.c9da0.1235@mx.google.com>
Date: Mon, 27 Nov 2023 08:25:15 -0800 (PST)
X-Google-Original-Date: 27 Nov 2023 11:25:13 -0500
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: koltencreed417@gmail.com
To: linux-mips@vger.kernel.org
Subject: Building Estimates
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Level: ***

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AKolten Creed		=0D=0ADreamland Estimation, LLC


