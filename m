Return-Path: <linux-mips+bounces-11549-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A5B97EAC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Sep 2025 02:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE56A4C16A4
	for <lists+linux-mips@lfdr.de>; Wed, 24 Sep 2025 00:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81BEBC2E0;
	Wed, 24 Sep 2025 00:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b="BhlgIPTt"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-g3-154.zohomail360.com (sender4-g3-154.zohomail360.com [136.143.188.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012BD19D071
	for <linux-mips@vger.kernel.org>; Wed, 24 Sep 2025 00:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758674594; cv=pass; b=Np+PLF4bMEBr7u3auJcgmh+cC9RXKO7gpBDSbFsRs6cAgVImj5L4nsNVhkjeQ8jNKjFCxKymyK1vIVwGBeroNl3wqT6VnHZfvLwE4oJyGkiBERcwSwWCAUwjCLd1CmMcRuUfImQJ+UUoLxpip4RRvJJAwl/uO/b35qI1wzx6SfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758674594; c=relaxed/simple;
	bh=x4Ku4EXGDqhhKqetmrJcxUTGOJqG/g/5svRjx28Acjc=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=btr0H+1dsHiWkgj5ZOItRjqf1IyegzVwxsoXy81d112HQSMitvuUMK1wg5tGsbxpS2GpLiVNRxjl3Msf0Zqkx1ZST4X3yLou/Eeu7XWUq9259PochD7zhizKIUuWzvoblOskeeoQLFonU+3BrBIbcARFJLQYQq07/iGkFDAKLuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx; dkim=pass (1024-bit key) header.d=maguitec.com.mx header.i=@maguitec.com.mx header.b=BhlgIPTt; arc=pass smtp.client-ip=136.143.188.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maguitec.com.mx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce-zem.maguitec.com.mx
ARC-Seal: i=1; a=rsa-sha256; t=1758674592; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=fS62m8Y6oiRQetEwPi8HtW+nXoen/DJrmH2Wk2Y0/PtqP9EAp0RWCGnqdhkGJxWNi0mZ/ee4wj8ZbZo3Cc4vcdAZBT7ShMN0IF6unmMFfdUqFjF7IxeJjp5sYblzPpulYCo6VT8AzaQ4y2wRN2DWKZ4N+mhzILDSyXVvNrcdIJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674592; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=x4Ku4EXGDqhhKqetmrJcxUTGOJqG/g/5svRjx28Acjc=; 
	b=GrA/EveUkRccJeHmoJD5LLbuWJ1o56sSnjrxWqpA6B1fA17rQepinuqTzwVObycPGVzarImGipP27xetb/Kex+7vcZU9gckF0R7xpfbhhfqovQzRViXmFV1qhw5Zf4HC4z9CAM/hmnk0s+dfoA0ah9a6EDBy7Dgn9R7qLTW9ies=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a8d8851-98d8-11f0-9ce0-52540088df93_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671652960237.67146497417252;
	Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=BhlgIPTtFUTe6MI50YcmyUQpzENl2BsksCkatxce66upHsKtwwmd3ARqhrhhXDwY+/0dZMPYb4ClvkEY/2e0C7CAe2blbhVWoZcNJJjTks9HQaJkh9ZNcA1aptBT7rrt1MwgYk7RQttnmyQFU+Iov24xKd75hbGPuxy1VqaPaIw=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=x4Ku4EXGDqhhKqetmrJcxUTGOJqG/g/5svRjx28Acjc=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:12 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
Reply-To: investorrelations@alhaitham-investment.ae
To: linux-mips@vger.kernel.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a8d8851-98d8-11f0-9ce0-52540088df93.19978ffc555@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a8d8851-98d8-11f0-9ce0-52540088df93.19978ffc555
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a8d8851-98d8-11f0-9ce0-52540088df93.19978ffc555
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a8d8851-98d8-11f0-9ce0-52540088df93.19978ffc555
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a8d8851-98d8-11f0-9ce0-52540088df93.19978ffc555
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a8d8851-98d8-11f0-9ce0-52540088df93.19978ffc555@zeptomail.com>
X-ZohoMailClient: External

To: linux-mips@vger.kernel.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be=20
honored to review your available investment projects for onward=20
referral to my principal investors who can allocate capital for=20
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

